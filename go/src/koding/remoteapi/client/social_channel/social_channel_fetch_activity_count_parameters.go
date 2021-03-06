package social_channel

// This file was generated by the swagger tool.
// Editing this file might prove futile when you re-run the swagger generate command

import (
	"net/http"
	"time"

	"golang.org/x/net/context"

	"github.com/go-openapi/errors"
	"github.com/go-openapi/runtime"
	cr "github.com/go-openapi/runtime/client"

	strfmt "github.com/go-openapi/strfmt"

	"koding/remoteapi/models"
)

// NewSocialChannelFetchActivityCountParams creates a new SocialChannelFetchActivityCountParams object
// with the default values initialized.
func NewSocialChannelFetchActivityCountParams() *SocialChannelFetchActivityCountParams {
	var ()
	return &SocialChannelFetchActivityCountParams{

		timeout: cr.DefaultTimeout,
	}
}

// NewSocialChannelFetchActivityCountParamsWithTimeout creates a new SocialChannelFetchActivityCountParams object
// with the default values initialized, and the ability to set a timeout on a request
func NewSocialChannelFetchActivityCountParamsWithTimeout(timeout time.Duration) *SocialChannelFetchActivityCountParams {
	var ()
	return &SocialChannelFetchActivityCountParams{

		timeout: timeout,
	}
}

// NewSocialChannelFetchActivityCountParamsWithContext creates a new SocialChannelFetchActivityCountParams object
// with the default values initialized, and the ability to set a context for a request
func NewSocialChannelFetchActivityCountParamsWithContext(ctx context.Context) *SocialChannelFetchActivityCountParams {
	var ()
	return &SocialChannelFetchActivityCountParams{

		Context: ctx,
	}
}

/*SocialChannelFetchActivityCountParams contains all the parameters to send to the API endpoint
for the social channel fetch activity count operation typically these are written to a http.Request
*/
type SocialChannelFetchActivityCountParams struct {

	/*Body
	  body of the request

	*/
	Body models.DefaultSelector

	timeout    time.Duration
	Context    context.Context
	HTTPClient *http.Client
}

// WithTimeout adds the timeout to the social channel fetch activity count params
func (o *SocialChannelFetchActivityCountParams) WithTimeout(timeout time.Duration) *SocialChannelFetchActivityCountParams {
	o.SetTimeout(timeout)
	return o
}

// SetTimeout adds the timeout to the social channel fetch activity count params
func (o *SocialChannelFetchActivityCountParams) SetTimeout(timeout time.Duration) {
	o.timeout = timeout
}

// WithContext adds the context to the social channel fetch activity count params
func (o *SocialChannelFetchActivityCountParams) WithContext(ctx context.Context) *SocialChannelFetchActivityCountParams {
	o.SetContext(ctx)
	return o
}

// SetContext adds the context to the social channel fetch activity count params
func (o *SocialChannelFetchActivityCountParams) SetContext(ctx context.Context) {
	o.Context = ctx
}

// WithBody adds the body to the social channel fetch activity count params
func (o *SocialChannelFetchActivityCountParams) WithBody(body models.DefaultSelector) *SocialChannelFetchActivityCountParams {
	o.SetBody(body)
	return o
}

// SetBody adds the body to the social channel fetch activity count params
func (o *SocialChannelFetchActivityCountParams) SetBody(body models.DefaultSelector) {
	o.Body = body
}

// WriteToRequest writes these params to a swagger request
func (o *SocialChannelFetchActivityCountParams) WriteToRequest(r runtime.ClientRequest, reg strfmt.Registry) error {

	r.SetTimeout(o.timeout)
	var res []error

	if err := r.SetBodyParam(o.Body); err != nil {
		return err
	}

	if len(res) > 0 {
		return errors.CompositeValidationError(res...)
	}
	return nil
}
