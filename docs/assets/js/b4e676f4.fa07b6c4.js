"use strict";(self.webpackChunkpangu_website=self.webpackChunkpangu_website||[]).push([[3614],{3905:(e,t,n)=>{n.d(t,{Zo:()=>c,kt:()=>d});var r=n(7294);function a(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function o(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,r)}return n}function l(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?o(Object(n),!0).forEach((function(t){a(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):o(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function u(e,t){if(null==e)return{};var n,r,a=function(e,t){if(null==e)return{};var n,r,a={},o=Object.keys(e);for(r=0;r<o.length;r++)n=o[r],t.indexOf(n)>=0||(a[n]=e[n]);return a}(e,t);if(Object.getOwnPropertySymbols){var o=Object.getOwnPropertySymbols(e);for(r=0;r<o.length;r++)n=o[r],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(a[n]=e[n])}return a}var i=r.createContext({}),s=function(e){var t=r.useContext(i),n=t;return e&&(n="function"==typeof e?e(t):l(l({},t),e)),n},c=function(e){var t=s(e.components);return r.createElement(i.Provider,{value:t},e.children)},p="mdxType",m={inlineCode:"code",wrapper:function(e){var t=e.children;return r.createElement(r.Fragment,{},t)}},b=r.forwardRef((function(e,t){var n=e.components,a=e.mdxType,o=e.originalType,i=e.parentName,c=u(e,["components","mdxType","originalType","parentName"]),p=s(n),b=a,d=p["".concat(i,".").concat(b)]||p[b]||m[b]||o;return n?r.createElement(d,l(l({ref:t},c),{},{components:n})):r.createElement(d,l({ref:t},c))}));function d(e,t){var n=arguments,a=t&&t.mdxType;if("string"==typeof e||a){var o=n.length,l=new Array(o);l[0]=b;var u={};for(var i in t)hasOwnProperty.call(t,i)&&(u[i]=t[i]);u.originalType=e,u[p]="string"==typeof e?e:a,l[1]=u;for(var s=2;s<o;s++)l[s]=n[s];return r.createElement.apply(null,l)}return r.createElement.apply(null,n)}b.displayName="MDXCreateElement"},5162:(e,t,n)=>{n.d(t,{Z:()=>l});var r=n(7294),a=n(6010);const o="tabItem_Ymn6";function l(e){let{children:t,hidden:n,className:l}=e;return r.createElement("div",{role:"tabpanel",className:(0,a.Z)(o,l),hidden:n},t)}},5488:(e,t,n)=>{n.d(t,{Z:()=>b});var r=n(7462),a=n(7294),o=n(6010),l=n(2389),u=n(7392),i=n(7094),s=n(2466);const c="tabList__CuJ",p="tabItem_LNqP";function m(e){const{lazy:t,block:n,defaultValue:l,values:m,groupId:b,className:d}=e,f=a.Children.map(e.children,(e=>{if((0,a.isValidElement)(e)&&"value"in e.props)return e;throw new Error(`Docusaurus error: Bad <Tabs> child <${"string"==typeof e.type?e.type:e.type.name}>: all children of the <Tabs> component should be <TabItem>, and every <TabItem> should have a unique "value" prop.`)})),g=m??f.map((e=>{let{props:{value:t,label:n,attributes:r}}=e;return{value:t,label:n,attributes:r}})),h=(0,u.l)(g,((e,t)=>e.value===t.value));if(h.length>0)throw new Error(`Docusaurus error: Duplicate values "${h.map((e=>e.value)).join(", ")}" found in <Tabs>. Every value needs to be unique.`);const v=null===l?l:l??f.find((e=>e.props.default))?.props.value??f[0].props.value;if(null!==v&&!g.some((e=>e.value===v)))throw new Error(`Docusaurus error: The <Tabs> has a defaultValue "${v}" but none of its children has the corresponding value. Available values are: ${g.map((e=>e.value)).join(", ")}. If you intend to show no default tab, use defaultValue={null} instead.`);const{tabGroupChoices:y,setTabGroupChoices:w}=(0,i.U)(),[k,O]=(0,a.useState)(v),T=[],{blockElementScrollPositionUntilNextRender:E}=(0,s.o5)();if(null!=b){const e=y[b];null!=e&&e!==k&&g.some((t=>t.value===e))&&O(e)}const x=e=>{const t=e.currentTarget,n=T.indexOf(t),r=g[n].value;r!==k&&(E(t),O(r),null!=b&&w(b,String(r)))},S=e=>{let t=null;switch(e.key){case"Enter":x(e);break;case"ArrowRight":{const n=T.indexOf(e.currentTarget)+1;t=T[n]??T[0];break}case"ArrowLeft":{const n=T.indexOf(e.currentTarget)-1;t=T[n]??T[T.length-1];break}}t?.focus()};return a.createElement("div",{className:(0,o.Z)("tabs-container",c)},a.createElement("ul",{role:"tablist","aria-orientation":"horizontal",className:(0,o.Z)("tabs",{"tabs--block":n},d)},g.map((e=>{let{value:t,label:n,attributes:l}=e;return a.createElement("li",(0,r.Z)({role:"tab",tabIndex:k===t?0:-1,"aria-selected":k===t,key:t,ref:e=>T.push(e),onKeyDown:S,onClick:x},l,{className:(0,o.Z)("tabs__item",p,l?.className,{"tabs__item--active":k===t})}),n??t)}))),t?(0,a.cloneElement)(f.filter((e=>e.props.value===k))[0],{className:"margin-top--md"}):a.createElement("div",{className:"margin-top--md"},f.map(((e,t)=>(0,a.cloneElement)(e,{key:t,hidden:e.props.value!==k})))))}function b(e){const t=(0,l.Z)();return a.createElement(m,(0,r.Z)({key:String(t)},e))}},2498:(e,t,n)=>{n.r(t),n.d(t,{assets:()=>i,contentTitle:()=>l,default:()=>p,frontMatter:()=>o,metadata:()=>u,toc:()=>s});var r=n(7462),a=(n(7294),n(3905));n(5488),n(5162);const o={slug:"pangu-dev-framework-apache-shenyu",title:"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6\u96c6\u6210 ShenYu \u7f51\u5173",authors:["xiongchun"],tags:["\u7f51\u5173","ShenYu","Dubbo","\u6cdb\u5316\u8c03\u7528"],date:new Date("2022-01-29T00:00:00.000Z"),description:"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6\u96c6\u6210 ShenYu \u7f51\u5173",hide_table_of_contents:!1},l=void 0,u={permalink:"/pangu-framework/blog/pangu-dev-framework-apache-shenyu",editUrl:"https://gitee.com/pulanos/pangu-framework/tree/master/pangu-website/blog/\u76d8\u53e4\u5f00\u53d1\u6846\u67b6\u96c6\u6210 ShenYu \u7f51\u5173.md",source:"@site/blog/\u76d8\u53e4\u5f00\u53d1\u6846\u67b6\u96c6\u6210 ShenYu \u7f51\u5173.md",title:"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6\u96c6\u6210 ShenYu \u7f51\u5173",description:"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6\u96c6\u6210 ShenYu \u7f51\u5173",date:"2022-01-29T00:00:00.000Z",formattedDate:"January 29, 2022",tags:[{label:"\u7f51\u5173",permalink:"/pangu-framework/blog/tags/\u7f51\u5173"},{label:"ShenYu",permalink:"/pangu-framework/blog/tags/shen-yu"},{label:"Dubbo",permalink:"/pangu-framework/blog/tags/dubbo"},{label:"\u6cdb\u5316\u8c03\u7528",permalink:"/pangu-framework/blog/tags/\u6cdb\u5316\u8c03\u7528"}],readingTime:9.75,hasTruncateMarker:!0,authors:[{name:"xiongchun",title:"Pangu Dev Framework maintainer",url:"https://gitee.com/xiong-chun",imageURL:"img/xiongchun.png",key:"xiongchun"}],frontMatter:{slug:"pangu-dev-framework-apache-shenyu",title:"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6\u96c6\u6210 ShenYu \u7f51\u5173",authors:["xiongchun"],tags:["\u7f51\u5173","ShenYu","Dubbo","\u6cdb\u5316\u8c03\u7528"],date:"2022-01-29T00:00:00.000Z",description:"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6\u96c6\u6210 ShenYu \u7f51\u5173",hide_table_of_contents:!1},prevItem:{title:"\u4f7f\u7528 Caddy \u90e8\u7f72\u76d8\u53e4\u9879\u76ee\u5b98\u7f51",permalink:"/pangu-framework/blog/caddy-vs-nginx"},nextItem:{title:"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6\u6587\u6863\u6392\u7248\u6307\u5357",permalink:"/pangu-framework/blog/chinese-copywriting-guidelines"}},i={authorsImageUrls:[void 0]},s=[],c={toc:s};function p(e){let{components:t,...n}=e;return(0,a.kt)("wrapper",(0,r.Z)({},c,n,{components:t,mdxType:"MDXLayout"}),(0,a.kt)("p",null,"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6\u4e0b\u5b9e\u73b0\u5fae\u670d\u52a1\u7f51\u5173\u7684\u7f3a\u7701\u59ff\u52bf\u4e3a\u57fa\u4e8e pangu-web \u6a21\u5757\u7684\u4f20\u7edf\u63a5\u53e3\u8c03\u7528\u6a21\u5f0f\uff0c\u5177\u4f53\u8bf7\u53c2\u8003\u6587\u6863\uff1a",(0,a.kt)("a",{parentName:"p",href:"/docs/quick-start/how-to-create-http-api"},"\u5982\u4f55\u53d1\u5e03\u5fae\u670d\u52a1 (API \u7f51\u5173)"),"\u3002\u672c\u6587\u63d0\u4f9b\u53e6\u5916\u4e00\u79cd\u901a\u8fc7\u96c6\u6210Apache ShenYu \u5b9e\u73b0\u7f51\u5173\u6cdb\u5316\u8c03\u7528 Dubbo \u670d\u52a1\u5c06\u5176\u53d1\u5e03\u4e3a HTTP \u63a5\u53e3\u7684\u53ef\u9009\u65b9\u6cd5\u3002"))}p.isMDXComponent=!0}}]);