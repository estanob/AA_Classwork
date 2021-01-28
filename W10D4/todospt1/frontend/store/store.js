import { createStore } from 'redux';

import rootReducer from '../reducers/root_reducer';


// const configureStore = createStore(rootReducer);
const configureStore = () => {
    debugger
    return createStore(rootReducer);
}

export default configureStore;