package main

import (
	"testing"

	"github.com/stretchr/testify/require"
)

func TestAddTwoNumbers(t *testing.T) {
	added := AddTwoNumbers(5, 10)
	require.Equal(t, 15, added)
}

func TestSubTwoNumbers(t *testing.T) {
	sub := SubTwoNumbers(10, 15)
	require.Equal(t, -2, sub)
}
