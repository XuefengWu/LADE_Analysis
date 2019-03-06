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
    const rootUrl = "http://localhost:9000"
    return (
      <div className="App"> 
      <Router>
        <div>
          <Route path="/class/:name/dependences" render={props=><ClassDependences root={rootUrl} {...props}/>}/>                                                          
          <Route path="/method_illegal/:relation/:search/:side" render={props=><MethodInvokesTable root={rootUrl} {...props}/>} />                                        
          <Route path="/method_illegal/:relation/:search" render={props=><MethodInvokesTable root={rootUrl} {...props}/>} />                                                            
          <Route path="/method_method/:relation/:search/:side" render={props=><MethodInvokesTable root={rootUrl} {...props}/>}/>                                        
          <Route path="/method_method/:relation/:search" render={props=><MethodInvokesTable root={rootUrl} {...props}/>}/>                                        
          <Route path="/method/:clz/:name/:invoke" render={props=><MethodInvokesGraph root={rootUrl} api={"/method/"} {...props}/>}/>                    
          <Route path="/class/:clz/:invoke" render={props=><MethodInvokesGraph root={rootUrl} api={"/class/"} {...props}/>}/>                    
          <Route path="/sqlaction/:clz/:name/:invoke" render={props=><MethodInvokesGraph root={rootUrl} api={"/sqlaction/"} {...props}/>}/>                    
          <Route path="/table/:clz/:name/:invoke" render={props=><MethodInvokesGraph root={rootUrl} api={"/table/"} {...props}/>}/>                    
          <Route path="/table/:clz/:invoke" render={props=><MethodInvokesGraph root={rootUrl} api={"/table/"} {...props}/>}/>                              
        </div>
      </Router> 
      </div>
    );
  }
}

export default App;
