kd                     = require 'kd'
React                  = require 'kd-react'
ActivityFlux           = require 'activity/flux'
Modal                  = require 'app/components/modal'
isPublicChannel        = require 'app/util/isPublicChannel'
KDReactorMixin         = require 'app/flux/base/reactormixin'
SidebarModalList       = require 'activity/components/sidebarmodallist'
PrivateChannelListItem = require 'activity/components/privatechannellistitem'

module.exports = class BrowsePrivateChannelsModal extends React.Component

  @defaultProps =
    isOpen : yes


  getDataBindings: ->
    threads: ActivityFlux.getters.followedPrivateChannelThreads
    selectedThread: ActivityFlux.getters.selectedChannelThread


  # if user clicks on channel in the list, modal will be closed
  # and user will be redirected to channel's page.
  # In this case we don't need to handle onClose event
  onItemClick: (event) -> @skipCloseHandling = yes


  onClose: ->

    return  @skipCloseHandling = no  if @skipCloseHandling
    return  unless @state.selectedThread

    channel = @state.selectedThread.get('channel').toJS()

    route = if isPublicChannel channel
    then "/Channels/#{channel.name}"
    else "/Messages/#{channel.id}"

    kd.singletons.router.handleRoute route


  render: ->

    title = 'Other Messages:'
    <Modal className='ChannelList-Modal PrivateChannelListModal' isOpen={@props.isOpen} onClose={@bound 'onClose'}>
      <SidebarModalList
        ref='SidebarModalList'
        title={title}
        searchProp='name'
        threads={@state.threads}
        onThresholdAction='loadFollowedPrivateChannels'
        onItemClick={@bound 'onItemClick'}
        itemComponent={PrivateChannelListItem}/>
    </Modal>


BrowsePrivateChannelsModal.include [KDReactorMixin]
