import React from 'react';
import ReactDOM from 'react-dom';
import * as Minesweeper from "../components/Minesweeper";
import Game from '../components/game';
import Tile from '../components/tile';


document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById('root');
  ReactDOM.render(<Game/>, root)
})