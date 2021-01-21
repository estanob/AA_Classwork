class FollowToggle {
  constructor ($ele) {
    this.followButton = $ele;
    this.userId = this.followButton.attr('user-id');
    this.followState = this.followButton.attr('initial-follow-state');
  }
}

module.exports = FollowToggle;