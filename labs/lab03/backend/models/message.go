package models

import (
	"errors"
	"time"
	
	"github.com/go-playground/validator/v10"
)

var (
	validate = validator.New()
)

// Message represents a chat message
type Message struct {
	ID        int       `json:"id"`
	Username  string    `json:"username"`
	Content   string    `json:"content"`
	Timestamp time.Time `json:"timestamp"`
}

// CreateMessageRequest represents the request to create a new message
type CreateMessageRequest struct {
	Username string `json:"username" validate:"required"`
	Content  string `json:"content"  validate:"required"`
}

// UpdateMessageRequest represents the request to update a message
type UpdateMessageRequest struct {
	Content string `json:"content" validate:"required"`
}

// HTTPStatusResponse represents the response for HTTP status code endpoint
type HTTPStatusResponse struct {
	StatusCode  int    `json:"statusCode"`
	ImageURL    string `json:"image_url"`
	Description string `json:"description"`
}

// APIResponse represents a generic API response
type APIResponse struct {
	Success bool   `json:"success"`
	Data    any    `json:"data,omitempty"`
	Error   string `json:"error,omitempty"`
}

// NewMessage creates a new message with the current timestamp
func NewMessage(id int, username, content string) *Message {
	return &Message{
		ID: id,
		Username: username,
		Content: content,
		Timestamp: time.Now(),
	}
}

var (
	ErrNoUsername = errors.New("no uesrname was provided")
	ErrNoContent = errors.New("no content was provided")
)

// Validate checks if the create message request is valid
func (r *CreateMessageRequest) Validate() error {
	if err := validate.Struct(r); err != nil {
		return err
	}
	return nil
}

// Validate checks if the update message request is valid
func (r *UpdateMessageRequest) Validate() error {
	if err := validate.Struct(r); err != nil {
		return err
	}
	return nil
}
