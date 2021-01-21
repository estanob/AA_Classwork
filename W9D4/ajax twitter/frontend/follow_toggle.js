
class FollowToggle {
  constructor ($ele) {
    this.followButton = $ele;
    this.userId = this.followButton.attr('data-user-id');
    this.followState = this.followButton.attr('data-initial-follow-state');
    this.render();
    this.handleClick();
  }

  render () {
    if (this.followState === "unfollowed") {
      this.followButton.html("Follow!");
    } else if (this.followState === "followed"){
      this.followButton.html("Unfollow!");
    }
  }

  handleClick () {
    this.followButton.click((e) => this.clickCallback.call(this, e))
  }
  
  clickCallback (e){
    console.log(this.followState);
    if (this.followState === "unfollowed") {
      $.ajax({
        method: "POST",
        url: `/users/${this.userId}/follow`,
        data: {
          user_id: this.userId
        },
        dataType: "JSON",
        success: res => this.handleSuccess(res),
        error: error => console.log(error)
      })
    } else if (this.followState === "followed") {
      $.ajax({
        url: `/users/${this.userId}/follow`,
        method: "POST",
        data: {
          _method: "DELETE"
        },
        success: res => this.handleSuccess(res),
        error: error => console.log(error)
      })
    }
  }

  handleSuccess(res) {
    this.followState === "followed" ? this.followState = "unfollowed" : this.followState = 'followed';
    this.render()
  }
}

module.exports = FollowToggle;