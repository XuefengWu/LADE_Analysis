import React, { Component } from 'react';

import 'font-awesome/css/font-awesome.min.css';
import 'bootstrap-css-only/css/bootstrap.min.css';

import './App.css';
import MethodInvokesGraph from './MethodInvokesGraph.jsx'
import MethodInvokesTable from './MethodInvokesTable.jsx'
import ClassDependences from './ClassDependences.jsx'

import { BrowserRouter as Router, Route } from 'react-router-dom'

class App extends Component {
  render() { 
    const rootUrl = "http://localhost:8900"
    return (
      <div className="App"> 
      <Router>
        <div>
          <Route path="/class/:name/dependences" render={props=><ClassDependences root={rootUrl} {...props}/>}/>                                                
          <Route path="/method_illegal/:relation/:search" render={props=><MethodInvokesTable root={rootUrl} {...props}/>} />                              
          <Route path="/method_method/:relation/:search" render={props=><MethodInvokesTable root={rootUrl} {...props}/>}/>                              
          <Route path="/method/:clz/:name/:invoke" render={props=><MethodInvokesGraph root={rootUrl} {...props}/>}/>                    
        </div>
      </Router> 
      </div>
    );
  }
}

export default App;
