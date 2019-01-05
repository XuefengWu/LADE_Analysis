import React, {Component} from 'react'
import * as dagreD3 from 'dagre-d3'
import * as d3 from 'd3'

class ClassDependences extends Component {
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
        const name = self.props.match.params.name
             
        var url = self.props.root + '/class/'+name+'/dependences'
        
        console.log(url)
        fetch(url)
        .then(response => response.json())
        .then(data => self.drawGraph(data,name))
        .catch(error => console.error(error))        
    }

    nodeLabel(n) {                 
        var properties = Object.assign({}, n.properties, {})
        delete properties.color      
        if(n.properties && n.properties.length > 0){
            return JSON.stringify(properties)+"\n"+n.title  
        } else {
            return n.title
        }        
    }

    nodeStyle(n,title){ 
        if(n.properties.length > 0 && n.properties.parent) {            
            return "fill: #afa"            
        }  
        if(n.title.indexOf(title) !== -1) {
            return "fill: yellow" 
        } 
        if(n.properties.color) {
            console.log(n.properties.color)
            return 'fill: ' + n.properties.color
        }              
    }
    nodeShape(v,title){          
        if(v.properties.length > 0 && v.properties.parent) {            
            return "ellipse"            
        }  
        if(v.title.indexOf(title) !== -1) {
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
    drawGraph(data,title) { 
        var self = this 
        var g = new dagreD3.graphlib.Graph({compound: true})
            .setGraph({edgesep: 10, ranksep: 60, nodesep: 10})
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
            // Round the corners of the nodes
            node.rx = node.ry = 5;
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
         
          svg.selectAll("g.node").on("click", function(id) { var _node = g.node(id); console.log("Clicked " + id,_node); });
   
    }

    render() {
        return <svg ref = {node => this.node = node}
                    width = {1800}
                    height = {1800}>
                </svg>
    }
}

export default ClassDependences