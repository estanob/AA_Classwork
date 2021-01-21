class FollowToggle {
  constructor ($ele) {
    this.followButton = $ele;
    this.userId = this.followButton.attr('user-id');
    this.followState = this.followButton.attr('initial-follow-state');
    this.render();
  }

  render () {
    if (this.followState === "unfollowed") {
      this.followButton.val("Follow!");
    } else {
      this.followButton.val("Unfollow!");
    }
  }

  handleClick () {
    $.ajax({
      method: "POST",
      url: `/users/${userId}/follow`,
      
    })
  }
}

module.exports = FollowToggle;