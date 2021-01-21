const FollowToggle = require('./follow_toggle');

$(() => {
  $('.follow-toggle').each(function(idx, ele) {
    new FollowToggle($('ele'))
  })
})