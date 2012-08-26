class CommentView extends KDView

  constructor:(options, data)->

    super

    @setClass "comment-container"
    @createSubViews data
    @resetDecoration()
    @attachListeners()

  render:->
    @resetDecoration()

  createSubViews:(data)->

    log "checking for comments in ", data

    @commentList = new KDListView
      type          : "comments"
      subItemClass  : CommentListItemView
      delegate      : @
    , data

    @commentController        = new CommentListViewController view: @commentList
    @addSubView showMore      = new CommentViewHeader delegate: @commentList, data
    @addSubView @commentList
    @addSubView @commentForm  = new NewCommentForm delegate : @commentList

    @commentList.on "OwnCommentHasArrived", -> showMore.ownCommentArrived()
    @commentList.on "CommentIsDeleted", -> showMore.ownCommentDeleted()

    if data.replies
      for reply in data.replies when reply? and 'object' is typeof reply
        @commentList.addItem reply

    @commentList.emit "BackgroundActivityFinished"

  attachListeners:->

    @listenTo
      KDEventTypes : "DecorateActiveCommentView"
      listenedToInstance : @commentList
      callback : @decorateActiveCommentState

    @listenTo
      KDEventTypes : "CommentLinkReceivedClick"
      listenedToInstance : @commentList
      callback : (pubInst, event) =>
        @commentForm.commentInput.setFocus()

    @commentList.on "CommentCountClicked", =>
      @commentList.emit "AllCommentsLinkWasClicked"

    @listenTo
      KDEventTypes : "CommentViewShouldReset"
      listenedToInstance : @commentList
      callback : @resetDecoration

  resetDecoration:->
    post = @getData()
    if post.repliesCount is 0
      @decorateNoCommentState()
    else
      @decorateCommentedState()

  decorateNoCommentState:->
    @unsetClass "active-comment"
    @unsetClass "commented"
    @setClass "no-comment"

  decorateCommentedState:->
    @unsetClass "active-comment"
    @unsetClass "no-comment"
    @setClass "commented"

  decorateActiveCommentState:->
    @unsetClass "commented"
    @unsetClass "no-comment"
    @setClass "active-comment"

  decorateItemAsLiked:(likeObj)->
    if likeObj?.results?.likeCount > 0
      @setClass "liked"
    else
      @unsetClass "liked"
    @ActivityActionsView.setLikedCount likeObj
