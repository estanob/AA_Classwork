import React from 'react';
import * as Minesweeper from "../components/Minesweeper";
import Game from './game';
import Tile from './tile';

class Board extends React.Component {
  constructor(props) { // <= includes this.state.board
    super(props) //pass props.board to other functions
    //props.updateGame()
  }

  render() {
    // console.log(this.props);    
    return(
      <div>
        <h2>T</h2>
        {this.props.board.grid.map((row, rowIdx) => {
          return(<div class=row key={rowIdx}>{row.map((tile, tileIdx) => {
            return <Tile class=tile key={tileIdx} tile={tile} updateGame={this.props.updateGame}/>
            // ^ key, title, updateGame are being passed in, only different syntax, no parentheses to pass in
          })}</div>)
        })}
      </div>
    )
  }
}

export default Board;