import React from 'react';
import * as Minesweeper from "../components/Minesweeper";
import Board from './board';

class Game extends React.Component {
  constructor(props) {
    super(props);
    this.state = { board: new Minesweeper.Board(4, 5) }; //create this.state & board key to crete new board
    this.updateGame = this.updateGame.bind(this);
  };

  updateGame() {

  };

  render() {
    return (
      <div>
        <h1>Minesweeper</h1>
        <Board board={this.state.board} updateGame={this.updateGame}/> 
      </div>
    )
  };
};

export default Game;