class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
  }

  bindEvents() {}

  makeMove($square) {}

  setupBoard() {
    const $ul = $('<ul>');

    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        let $li = $('<li>').attr("pos", [i, j]);
        $ul.append($li);
      }
    };

    this.$el.append($ul);


    // for (let j = 0; j <= 3; j++) {
    //   const $button = $("<button>").html("Exercise " + j);
    //   $button.on("click", this["exercise" + j]);
    //   this.$el.append($button);
    // }

    // for (let i = 0; i < 3; i++) {
    //   this.addRow();
    // }

    // View.prototype.addRow = function () {
    //   const rowIdx = this.$el.find(".row").length;
    //   const $row = $("<ul>").addClass("row").addClass("group");
    //   for (let colIdx = 0; colIdx < 20; colIdx++) {
    //     const $square = $("<li>").addClass("square").attr("data-pos", [rowIdx, colIdx]);
    //     $square.on("mouseenter", (e) => {
    //       const $square = $(e.currentTarget);
    //       $square.css("background-color", window._randomColorString());
    //     });
    //     $row.append($square);
    //   }
    //   this.$el.append($row);
    // };
  }
}

module.exports = View;
