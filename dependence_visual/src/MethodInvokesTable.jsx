import React, {Component} from 'react' 

import Table from 'react-bootstrap/lib/Table';
import Badge from 'react-bootstrap/lib/Badge';

class MethodInvokesTable extends Component {
    constructor(props) {
        super(props)
        this.createCloud = this.createCloud.bind(this)
        this.state = {data: []};
    }

    componentDidMount() {
        this.createCloud()
    }

    componentDidUpdate() {
        //this.createCloud()
    }

    filterData(data,search,side) {
        
        if(search && search.length >0){            
            if(!side){
                side = "callee"
            } 
            const re = new RegExp(search)            
            var filted = []
            switch (side) {
                case "callee": {
                    filted = data.filter(function(v){return v.calleeClass.indexOf(search) !== -1})
                    break
                }
                case "caller": {
                    filted = data.filter(function(v){return v.callerClass.indexOf(search) !== -1})
                    break
                }
                case "callee_regexp":
                    filted = data.filter(function(v){return re.test(v.calleeClass)})
                    console.log(filted.length)
                    break
                case "caller_regexp":
                    filted = data.filter(function(v){return re.test(v.callerClass)})
                    break
                default: {
                    filted = data.filter(function(v){return re.test(v.callerClass) || re.test(v.calleeClass)})
                    if(filted || filted.length < 1) {
                        filted = data.filter(function(v){return v.callerClass.indexOf(search) !== -1 || v.calleeClass.indexOf(search) !== -1})
                    } 
                    break
                }    
            } 

            return filted            
        } else {
            return data
        }
    }

    createCloud() { 
        const self = this
        
        const relation = self.props.match.params.relation
        const search = self.props.match.params.search
        
        console.log(relation)
        
        const root = self.props.root
        const relations = relation.split("_")
        var url = root + "/method_method/"+relations[0]+"/"+relations[1]
        console.log(url)
        fetch(url)
        .then(response => response.json())
        .then(data => {
            console.log(search)
            const side = self.props.match.params.side
            const founded = self.filterData(data,search,side)
            if(!founded || founded.length < 1) {
                document.getElementById('loading').innerHTML = "Can not match anything for: <b>"+search+"</b>"
            } else {
                self.setState({data: founded})               
            } 
        })         
        .catch(error => console.error(error)) 
    }
 
    render(){ 
        const data = this.state.data        
        if(data && data.length > 0){
        return <div>
        <p>
        Total Dependences <Badge>{data.length}</Badge>
        </p>    
        <Table striped bordered condensed hover responsive>
        <thead>
          <tr>
            <th>callerClass</th>
            <th>callerMethod</th>
            <th>calleeClass</th>
            <th>calleeMethod</th>
          </tr>
        </thead>
        <tbody align="left" width="1024">
        
        {
            data.map(function(item, i){
            return <tr key={item.callerClass+i}>
                        <td><a href={'/class/'+item.callerClass+'/dependences'} target='_blank' rel='noopener noreferrer'>{item.callerClass.substring(9,95)}</a></td>
                        <td><a href={'/method/'+item.callerClass+'/'+item.callerMethod+'/invokes'} target='_blank' rel='noopener noreferrer'>{item.callerMethod}</a></td>
                        <td><a href={'/class/'+item.calleeClass+'/dependences'} target='_blank' rel='noopener noreferrer'>{item.calleeClass.substring(9,95)}</a></td>
                        <td><a href={'/method/'+item.calleeClass+'/'+item.calleeMethod+'/invokes'} target='_blank' rel='noopener noreferrer'>{item.calleeMethod}</a></td>
                    </tr>
        })}           
        </tbody>
      </Table></div>
      } else {
        return <div id="loading">Loading...</div>
      }
    }
}
 

export default MethodInvokesTable