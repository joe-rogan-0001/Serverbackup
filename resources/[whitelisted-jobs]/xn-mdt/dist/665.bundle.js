"use strict";(self.webpackChunkreacttest=self.webpackChunkreacttest||[]).push([[665],{1665:(e,t,r)=>{r.r(t),r.d(t,{default:()=>J}),r(9753),r(2526),r(1817),r(1539),r(2165),r(6992),r(8783),r(3948),r(7042),r(8309),r(1038),r(4916);var n=r(7294),o=r(3173),a=r(9681),i=r(3122),l=(r(7941),r(2772),r(9070),r(5003),r(9554),r(4747),r(9337),r(3321),r(2222),r(7327),r(1058),r(3710),r(8674),r(3210),r(6912)),c=r(1051),u=r(1496),s=r(982),f=r(9417),d=r(6192),m=r(5668),p=r(287),y=r(2994),v=r(1619),b=r(6601),h=r(3405),E=r(2918),g=r(8767),w=r(3796),S=r(8528),O=r(435),Z=r(482),j=r(284),A=["loadedReport","setLoadedReport"];function I(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}function L(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?I(Object(r),!0).forEach((function(t){C(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):I(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}function C(e,t,r){return t in e?Object.defineProperty(e,t,{value:r,enumerable:!0,configurable:!0,writable:!0}):e[t]=r,e}function P(e){return function(e){if(Array.isArray(e))return T(e)}(e)||function(e){if("undefined"!=typeof Symbol&&null!=e[Symbol.iterator]||null!=e["@@iterator"])return Array.from(e)}(e)||R(e)||function(){throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}()}function k(e,t){return function(e){if(Array.isArray(e))return e}(e)||function(e,t){var r=null==e?null:"undefined"!=typeof Symbol&&e[Symbol.iterator]||e["@@iterator"];if(null!=r){var n,o,a=[],i=!0,l=!1;try{for(r=r.call(e);!(i=(n=r.next()).done)&&(a.push(n.value),!t||a.length!==t);i=!0);}catch(e){l=!0,o=e}finally{try{i||null==r.return||r.return()}finally{if(l)throw o}}return a}}(e,t)||R(e,t)||function(){throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}()}function R(e,t){if(e){if("string"==typeof e)return T(e,t);var r=Object.prototype.toString.call(e).slice(8,-1);return"Object"===r&&e.constructor&&(r=e.constructor.name),"Map"===r||"Set"===r?Array.from(e):"Arguments"===r||/^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)?T(e,t):void 0}}function T(e,t){(null==t||t>e.length)&&(t=e.length);for(var r=0,n=new Array(t);r<t;r++)n[r]=e[r];return n}var N=window.locales.reports,x=window.locales;const D=function(e){var t=e.loadedReport,r=e.setLoadedReport,o=function(e,t){if(null==e)return{};var r,n,o=function(e,t){if(null==e)return{};var r,n,o={},a=Object.keys(e);for(n=0;n<a.length;n++)r=a[n],t.indexOf(r)>=0||(o[r]=e[r]);return o}(e,t);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);for(n=0;n<a.length;n++)r=a[n],t.indexOf(r)>=0||Object.prototype.propertyIsEnumerable.call(e,r)&&(o[r]=e[r])}return o}(e,A),i=(0,g.useQueryClient)(),I=k((0,n.useState)(!o.isLawyer),2),C=I[0],R=I[1],T=k((0,n.useState)(N.investigative),2),D=T[0],z=T[1],J=k((0,n.useState)(""),2),M=J[0],U=J[1],V=k((0,n.useState)(""),2),$=V[0],F=V[1],G=k((0,n.useState)([]),2),Q=G[0],q=G[1],B=k((0,n.useState)([]),2),H=B[0],K=B[1],W=k((0,n.useState)([]),2),X=W[0],Y=W[1],_=k((0,n.useState)([]),2),ee=_[0],te=_[1],re=(0,g.useMutation)((function(e){return new Promise((function(t,r){if(""===$.trim()||""===M.trim())return r(new Error(x.emptyField));w.Z.send("SaveReport",e,(function(e){if(!e.success)return r(new Error(e.error||x.failed));t(e)}))}))}),{onSuccess:function(e){var t=e.id;r(t),i.refetchQueries("ListReports")}}),ne=k((0,j.Z)("reports",t,(function(e){z(e.type),U(e.title),F(e.description),q(JSON.parse(e.persons)),K(JSON.parse(e.officers)),Y(JSON.parse(e.vehicles)),te(JSON.parse(e.evidences)),!re.isSuccess&&!re.isLoading&&ie(!0),o.isLawyer&&R(!1)}),R,o.isLawyer),3),oe=ne[0],ae=ne[1],ie=ne[2];return n.createElement(n.Fragment,null,n.createElement(l.Z,null,n.createElement(c.Z,null,n.createElement(u.Z,{name:0===t?N.create:"".concat(N.edit," (#").concat(t,")")}),oe&&ae&&n.createElement(Z.Z,{title:x.successTitle,subTitle:"".concat(N.reportLoaded," ").concat(t),onClick:function(){ie(!1)}}),re.isError&&n.createElement(O.Z,{title:x.errorTitle,subTitle:re.error.message,onClick:function(){re.reset()}}),re.isSuccess&&n.createElement(Z.Z,{title:x.successTitle,subTitle:"".concat(N.reportSaved," ").concat(t),onClick:function(){re.reset()}}),re.isLoading&&n.createElement(s.G,{icon:f.LM3,pulse:!0}),re.isIdle&&n.createElement(d.Z,{new:!o.isLawyer&&0!==t,onSave:function(){re.mutate({loadedReport:t,type:D,title:M,description:$,persons:Q,officers:H,vehicles:X,evidences:ee,date:new Date})},onNew:function(){U(""),F(""),q([]),K([]),Y([]),te([]),R(!0),r(0)},save:!o.isLawyer&&C})),n.createElement(m.Z,null,n.createElement(S.Z,{placeholder:N.type,options:[N.investigative,N.civilian,N.bolo],selected:D,onOptionSelect:z,readonly:!C}),n.createElement(p.Z,{placeholder:N.reportTitle,value:M,onChange:U,readonly:!C},n.createElement(s.G,{icon:f.UJf})),n.createElement(y.Z,{placeholder:x.placeholder,value:$,onChange:F,readonly:!C}),n.createElement(v.Z,{addEvidence:function(e){te([].concat(P(ee),[L({},e)]))},evidences:ee,removeEvidence:function(e){te(P(ee.filter((function(t){return t.id!==parseInt(e)}))))},readonly:!C}))),n.createElement(a.Z,null),n.createElement(l.Z,null,n.createElement(m.Z,null,n.createElement(b.Z,{assignOfficer:function(e,t){K([].concat(P(H),[{citizenid:e,name:t}]))},assignedOfficers:H,removeOfficer:function(e){K(H.filter((function(t){return t.citizenid!==e})))},readonly:!C}),n.createElement(h.Z,{assignPerson:function(e,t){q([].concat(P(Q),[{citizenid:e,name:t}]))},assignedPersons:Q,removePerson:function(e){q(Q.filter((function(t){return t.citizenid!==e})))},readonly:!C}),n.createElement(E.Z,{assignVehicle:function(e,t,r){Y([].concat(P(X),[{plate:e.plate,seize:t,fine:parseInt(r)}]))},assignedVehicles:X,removeVehicle:function(e){Y(X.filter((function(t){return t.plate!==e})))},readonly:!C}))))};function z(e,t){(null==t||t>e.length)&&(t=e.length);for(var r=0,n=new Array(t);r<t;r++)n[r]=e[r];return n}const J=function(e){var t,r,l=(t=(0,n.useState)(0),r=2,function(e){if(Array.isArray(e))return e}(t)||function(e,t){var r=null==e?null:"undefined"!=typeof Symbol&&e[Symbol.iterator]||e["@@iterator"];if(null!=r){var n,o,a=[],i=!0,l=!1;try{for(r=r.call(e);!(i=(n=r.next()).done)&&(a.push(n.value),!t||a.length!==t);i=!0);}catch(e){l=!0,o=e}finally{try{i||null==r.return||r.return()}finally{if(l)throw o}}return a}}(t,r)||function(e,t){if(e){if("string"==typeof e)return z(e,t);var r=Object.prototype.toString.call(e).slice(8,-1);return"Object"===r&&e.constructor&&(r=e.constructor.name),"Map"===r||"Set"===r?Array.from(e):"Arguments"===r||/^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)?z(e,t):void 0}}(t,r)||function(){throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}()),c=l[0],u=l[1];return n.createElement(o.Z,{id:"reports",active:e.active},n.createElement(i.Z,{loadReport:function(e){u(e)},active:"Reports"===e.active,event:"ListReports"}),n.createElement(a.Z,null),n.createElement(D,{isLawyer:e.isLawyer,loadedReport:c,setLoadedReport:u}),n.createElement(a.Z,null))}},4185:(e,t,r)=>{r.d(t,{Z:()=>o});var n=r(7294);const o=function(e){return n.createElement("div",{className:"item",onClick:e.onClick},n.createElement("div",{className:"item-details-container"},n.createElement("div",{className:"item-detail-header--dashboard"},e.item.title," - ",e.item.type),n.createElement("div",{className:"item-detail-footer--dashboard"},n.createElement("div",{id:"item-id"},"ID: ",e.item.id),n.createElement("div",{id:"expire-time"},e.item.createdbyname," -- ",e.item.date," ago"))))}},3122:(e,t,r)=>{r.d(t,{Z:()=>p}),r(4916),r(4765),r(1249),r(9753),r(2526),r(1817),r(1539),r(2165),r(6992),r(8783),r(3948),r(7042),r(8309),r(1038);var n=r(7294),o=r(6912),a=r(1051),i=r(2053),l=r(1496),c=r(5668),u=r(4185),s=r(4443);function f(e,t){(null==t||t>e.length)&&(t=e.length);for(var r=0,n=new Array(t);r<t;r++)n[r]=e[r];return n}var d=window.locales.reports,m=window.locales;const p=function(e){var t,r,p=(t=(0,s.Z)(e.event,e.event,e.active),r=3,function(e){if(Array.isArray(e))return e}(t)||function(e,t){var r=null==e?null:"undefined"!=typeof Symbol&&e[Symbol.iterator]||e["@@iterator"];if(null!=r){var n,o,a=[],i=!0,l=!1;try{for(r=r.call(e);!(i=(n=r.next()).done)&&(a.push(n.value),!t||a.length!==t);i=!0);}catch(e){l=!0,o=e}finally{try{i||null==r.return||r.return()}finally{if(l)throw o}}return a}}(t,r)||function(e,t){if(e){if("string"==typeof e)return f(e,t);var r=Object.prototype.toString.call(e).slice(8,-1);return"Object"===r&&e.constructor&&(r=e.constructor.name),"Map"===r||"Set"===r?Array.from(e):"Arguments"===r||/^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)?f(e,t):void 0}}(t,r)||function(){throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}()),y=p[0],v=p[1],b=p[2];return n.createElement(o.Z,null,n.createElement(a.Z,null,n.createElement(l.Z,{name:d.title}),n.createElement(i.Z,{placeholder:m.search,value:y,onChange:v})),n.createElement(c.Z,null,b.map((function(t,r){return n.createElement(u.Z,{item:t,key:t.id?t.id:r,onClick:function(){e.loadReport(t.id)}})}))))}}}]);