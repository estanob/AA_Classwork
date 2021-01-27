const FollowToggle = require('./follow_toggle');
const UsersSearch = require('./users_search');

$(() => {
  $('.follow-toggle').each(function(idx, ele) {
    new FollowToggle($(ele))
  })
  $('.users-search').each(function(idx, ele) {
    new UsersSearch($(ele))
  })
})