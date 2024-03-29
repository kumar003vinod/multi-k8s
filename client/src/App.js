import React from 'react';
// import logo from './logo.svg';
import './App.css';
import {BrowserRouter as Router, Route, Link} from 'react-router-dom';
import Fib from './Fib';
import OtherPage from './OtherPage';

function App() {
  return (
    <Router>
      <div className="App">
        <header className="App-header">
          <h1>Fib Calc V1</h1>
          <Link to="/">Home</Link>
          <Link to="/otherPage">Other Page</Link>
          <div>
            <Route exact path = "/" component={Fib}></Route>
            <Route path="/otherPage" component={OtherPage}></Route>
          </div>
        </header>
      </div>
    </Router>
  );
}

export default App;
