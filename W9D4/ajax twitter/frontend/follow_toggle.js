const APIUtil = require('./api_util')

class FollowToggle {
  constructor ($ele) {
    this.followButton = $ele;
    this.userId = this.followButton.attr('data-user-id');
    this.followState = this.followButton.attr('data-initial-follow-state');
    this.render();
    this.handleClick();
  }

  render () {
    console.log(this.followState);
    if (this.followState === "unfollowed") { //<= resolved
      this.followButton.prop("disabled", false);
      this.followButton.html("Follow!");
    } else if (this.followState === "followed"){ //<= resolved
      this.followButton.prop("disabled", false);
      this.followButton.html("Unfollow!");
    } else { // disable because we're following/unfollowing 
    // ^ pending state
      this.followButton.prop("disabled", true);
    }
  }

  handleClick () {
    this.followButton.click((e) => {
      if (this.followState === "unfollowed") {
        this.followState = "following";
        this.render();
        APIUtil.followUser(this.userId)
        .then(res => this.handleSuccess(res))
        .catch(error => console.log(error));
      } else if (this.followState === "followed") {
        this.followState = "unfollowing";
        this.render();
        APIUtil.unfollowUser(this.userId)
          .then(res => this.handleSuccess(res))
          .catch(error => console.log(error));
      }
    })
  }

  handleSuccess(res) {
    if (this.followState === "following") this.followState = "unfollowed";
    if (this.followState === "unfollowing") this.followState = "followed";
    this.followState === "followed" ? this.followState = "unfollowed" : this.followState = 'followed';
    this.render();
  }
}

module.exports = FollowToggle;