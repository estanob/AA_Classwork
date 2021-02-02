import { createStore, applyMiddleware } from 'redux';
import thunkMiddleware from '../middleware/thunk';
import rootReducer from '../reducers/root_reducer';


// const configureStore = createStore(rootReducer);
const configureStore = () => {
    return createStore(rootReducer, applyMiddleware(thunkMiddleware));
}

export default configureStore;