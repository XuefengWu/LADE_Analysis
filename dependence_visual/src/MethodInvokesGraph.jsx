import React, {Component} from 'react'
import './MethodInvokesGraph.css'
import * as dagreD3 from 'dagre-d3'
import * as d3 from 'd3'
//import * as qs from 'query-string';

class MethodInvokesGraph extends Component {
    constructor(props) {
        super(props)
        this.createCloud = this.createCloud.bind(this)
    }

    componentDidMount() {
        this.createCloud()
    }

    componentDidUpdate() {
        this.createCloud()
    }

    createCloud() {
        var self = this 
        const clz = self.props.match.params.clz
        const name = self.props.match.params.name
        const invokeAction = self.props.match.params.invoke
        const callerDeep = self.props.match.params.callerdeep        
        var url = self.props.root + self.props.api +clz+'/' + invokeAction
        if(name) {
            url = self.props.root + self.props.api +clz+'/'+name+'/' + invokeAction
        }
        if(callerDeep){
            url = url + '/callers/' + callerDeep
        }                 
        //const parsed = qs.parse(self.props.location.search);
        //console.log(parsed);

        fetch(url+self.props.location.search)
        .then(response => {
            console.log(response)
            if(response.ok){
                document.getElementById('loading').innerHTML = "<div></div>"
                return response.json()
            } else {
                document.getElementById('loading').innerHTML = "<div>"+response.status+":"+response.statusText+"</div>"
                return {nodes:[]}
            }           
        })
        .then(data => self.drawGraph(data,clz+"."+name))
        .catch(error => console.error(error))
        
    }

    nodeLabel(n) {        
        var properties = Object.assign({}, n.properties, {})
        delete properties.color       
        if(properties && !(Object.keys(properties).length === 0 && properties.constructor === Object)) {            
            return JSON.stringify(properties)+"\n"+n.title              
        } else {
            return n.title              
        }        
    }

    nodeStyle(n,title){
        if(n.properties.length > 0 && n.properties.parents) {            
            return "fill: #afa"            
        }  
        if(title.indexOf(n.title) !== -1) {
            return "fill: yellow" 
        } 
        if(n.properties.color) {            
            return 'fill: ' + n.properties.color
        }              
    }

    nodeShape(n,title){          
        if(n.properties.length > 0 && n.properties.parents) {            
            return "ellipse"            
        }  
        if(title.indexOf(n.title) !== -1) {
            return "diamond"
        } else {
            return "rect"           
        }
    }
    edgeLabel(v) {         
        if(v.labels.length > 0) {
            return "("+v.labels+")"
        }
    }
    edgeArrowhead(v) {
        if(v.labels.length > 0) {
            if(v.labels.indexOf("parent") !== -1) {
                return "normal"
            } 
        }
        return "vee"
    }
    edgeArrowheadStyle(v) {
        if(v.labels.length > 0) {
            if(v.labels.indexOf("parent") !== -1) {
                return "fill: #f66"
            } 
        } 
    }
    edgeStyle(v) {
        if(v.labels.length > 0) {
            if(v.labels.indexOf("parent") !== -1) {
                return "stroke: #f66;stroke-width: 3px;"
            } 
        } 
    }

    openNewWindows(nodeLabel) {  
        const pathname = this.props.location.pathname
        const search = this.props.location.search       
        
        var clz = "";
        var m = "";
        var fullMethod = nodeLabel;
        
        if(nodeLabel.indexOf("\n") > 0){            
            fullMethod = nodeLabel.split("\n")[1];
        } 
        const l = pathname.substring(1) 
        const rootPath = l.substr(0,l.indexOf("/"))
        const resouceRelation = pathname.substr(pathname.lastIndexOf("/")+1)
        if("class" === rootPath) {        
            clz = nodeLabel             
            window.open("/class/"+clz+"/"+resouceRelation+search);
        } else {
            console.log("rootPath:"+rootPath)
            clz = fullMethod.substr(0,fullMethod.lastIndexOf("."))
            m = fullMethod.substr(fullMethod.lastIndexOf(".")+1)
            console.log(clz)
            window.open("/method/"+clz+"/"+m+"/" + resouceRelation+search);    
        }
    }

    drawGraph(data,title) { 
        if(data.nodes.length === 0){
            return
        }
        var self = this 
        var g = new dagreD3.graphlib.Graph({compound: true})
            .setGraph({rankdir: 'LR', edgesep: 10, ranksep: 60, nodesep: 10})
            .setDefaultEdgeLabel(function () {
                return {};
            });

         data.nodes.forEach(function(v){
            g.setNode(v.id, {
                label: self.nodeLabel(v),
                style: self.nodeStyle(v,title),
                shape: self.nodeShape(v,title)
            });
         });
         data.edges.forEach(function(v){
            g.setEdge(v.a, v.b,{
                label:self.edgeLabel(v),
                arrowhead: self.edgeArrowhead(v),
                arrowheadStyle:self.edgeArrowheadStyle(v)
            });    
            
         }); 
        
        g.nodes().forEach(function (v) {
            var node = g.node(v);
            if(node === undefined) { 
                console.log(v)
                console.log("node is " + node)
            } else {
                // Round the corners of the nodes
                node.rx = node.ry = 5;                
            } 
        });


        // Create the renderer
        ////var render = new dagreD3.render();

        // Set up an SVG group so that we can translate the final graph.
        var svg = d3.select("svg");
        svg.select("g").remove();
        var svgGroup = svg.append("g");          

        //zoom
        const zoom = d3.zoom().on('zoom', () => {                         
            svgGroup.attr("transform", d3.event.transform);            
          });
          svg.call(zoom);
          
          const render = new dagreD3.render();

          render(svgGroup, g);
         
          svg.selectAll("g.node").on("click", function(id) { var _node = g.node(id); self.openNewWindows(_node.label); });
        
    }

    render() {
        return <div>
                <div id="loading">Loading...</div>
                <svg ref = {node => this.node = node}
                    width = {1800}
                    height = {1800}>
                </svg>
                </div>
    }
}

export default MethodInvokesGraph