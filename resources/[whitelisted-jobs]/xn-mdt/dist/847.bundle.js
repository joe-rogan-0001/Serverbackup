"use strict";(self.webpackChunkreacttest=self.webpackChunkreacttest||[]).push([[847],{3847:(e,t,r)=>{r.r(t),r.d(t,{default:()=>U}),r(9753),r(2526),r(1817),r(1539),r(2165),r(6992),r(8783),r(3948),r(7042),r(8309),r(1038),r(4916);var n=r(7294),o=r(3173),a=r(9681),i=r(3122),l=(r(7941),r(2772),r(9070),r(5003),r(9554),r(4747),r(9337),r(3321),r(2222),r(7327),r(1058),r(3710),r(8674),r(3210),r(6912)),c=r(1051),u=r(1496),s=r(982),f=r(9417),d=r(6192),m=r(5668),p=r(287),y=r(2994),v=r(1619),b=r(6601),h=r(3405),E=r(2918),g=r(8767),w=r(3796),S=r(8528),O=r(435),Z=r(482),j=r(284),A=["loadedReport","setLoadedReport"];function I(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}function R(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?I(Object(r),!0).forEach((function(t){C(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):I(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}function C(e,t,r){return t in e?Object.defineProperty(e,t,{value:r,enumerable:!0,configurable:!0,writable:!0}):e[t]=r,e}function P(e){return function(e){if(Array.isArray(e))return L(e)}(e)||function(e){if("undefined"!=typeof Symbol&&null!=e[Symbol.iterator]||null!=e["@@iterator"])return Array.from(e)}(e)||T(e)||function(){throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}()}function k(e,t){return function(e){if(Array.isArray(e))return e}(e)||function(e,t){var r=null==e?null:"undefined"!=typeof Symbol&&e[Symbol.iterator]||e["@@iterator"];if(null!=r){var n,o,a=[],i=!0,l=!1;try{for(r=r.call(e);!(i=(n=r.next()).done)&&(a.push(n.value),!t||a.length!==t);i=!0);}catch(e){l=!0,o=e}finally{try{i||null==r.return||r.return()}finally{if(l)throw o}}return a}}(e,t)||T(e,t)||function(){throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}()}function T(e,t){if(e){if("string"==typeof e)return L(e,t);var r=Object.prototype.toString.call(e).slice(8,-1);return"Object"===r&&e.constructor&&(r=e.constructor.name),"Map"===r||"Set"===r?Array.from(e):"Arguments"===r||/^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)?L(e,t):void 0}}function L(e,t){(null==t||t>e.length)&&(t=e.length);for(var r=0,n=new Array(t);r<t;r++)n[r]=e[r];return n}var N=window.emsReportTypes,x=window.locales.emsReport,D=window.locales.doctorsInvolved,M=window.locales;const z=function(e){var t=e.loadedReport,r=e.setLoadedReport,o=(function(e,t){if(null==e)return{};var r,n,o=function(e,t){if(null==e)return{};var r,n,o={},a=Object.keys(e);for(n=0;n<a.length;n++)r=a[n],t.indexOf(r)>=0||(o[r]=e[r]);return o}(e,t);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);for(n=0;n<a.length;n++)r=a[n],t.indexOf(r)>=0||Object.prototype.propertyIsEnumerable.call(e,r)&&(o[r]=e[r])}}(e,A),(0,g.useQueryClient)()),i=k((0,n.useState)(!0),2),I=i[0],C=i[1],T=k((0,n.useState)("Medical Report"),2),L=T[0],z=T[1],J=k((0,n.useState)(""),2),U=J[0],V=J[1],$=k((0,n.useState)(""),2),F=$[0],G=$[1],Q=k((0,n.useState)([]),2),q=Q[0],B=Q[1],H=k((0,n.useState)([]),2),K=H[0],W=H[1],X=k((0,n.useState)([]),2),Y=X[0],_=X[1],ee=k((0,n.useState)([]),2),te=ee[0],re=ee[1],ne=(0,g.useMutation)((function(e){return new Promise((function(t,r){if(""===F.trim()||""===U.trim())return r(new Error(M.emptyField));w.Z.send("SaveEmsReport",e,(function(e){if(!e.success)return r(new Error(e.error||M.failed));t(e)}))}))}),{onSuccess:function(e){var t=e.id;r(t),o.refetchQueries("ListEmsReports")}}),oe=k((0,j.Z)("emsreports",t,(function(e){console.log(e),z(e.type),V(e.title),G(e.description),B(JSON.parse(e.persons)),W(JSON.parse(e.officers)),_(JSON.parse(e.vehicles)),re(JSON.parse(e.gallery)),!ne.isSuccess&&!ne.isLoading&&le(!0)}),C),3),ae=oe[0],ie=oe[1],le=oe[2];return n.createElement(n.Fragment,null,n.createElement(l.Z,null,n.createElement(c.Z,null,n.createElement(u.Z,{name:0===t?x.create:"".concat(x.edit," (#").concat(t,")")}),ae&&ie&&n.createElement(Z.Z,{title:M.successTitle,subTitle:"".concat(x.reportLoaded," ").concat(t),onClick:function(){le(!1)}}),ne.isError&&n.createElement(O.Z,{title:M.errorTitle,subTitle:ne.error.message,onClick:function(){ne.reset()}}),ne.isSuccess&&n.createElement(Z.Z,{title:M.successTitle,subTitle:"".concat(x.reportSaved," ").concat(t),onClick:function(){ne.reset()}}),ne.isLoading&&n.createElement(s.G,{icon:f.LM3,pulse:!0}),ne.isIdle&&n.createElement(d.Z,{new:0!==t,onSave:function(){ne.mutate({loadedReport:t,type:L,title:U,description:F,persons:q,officers:K,vehicles:Y,gallery:te,date:new Date})},onNew:function(){V(""),G(""),B([]),W([]),_([]),re([]),C(!0),r(0)},save:I})),n.createElement(m.Z,null,n.createElement(S.Z,{placeholder:x.type,options:N,selected:L,onOptionSelect:z,readonly:!I}),n.createElement(p.Z,{placeholder:x.reportTitle,value:U,onChange:V,readonly:!I},n.createElement(s.G,{icon:f.UJf})),n.createElement(y.Z,{placeholder:M.placeholder,value:F,onChange:G,readonly:!I}),n.createElement(v.Z,{type:"ems",addEvidence:function(e){re([].concat(P(te),[R({},e)]))},evidences:te,removeEvidence:function(e){re(P(te.filter((function(t){return t.id!==parseInt(e)}))))},readonly:!I}))),n.createElement(a.Z,null),n.createElement(l.Z,null,n.createElement(m.Z,null,n.createElement(b.Z,{assignOfficer:function(e,t){W([].concat(P(K),[{citizenid:e,name:t}]))},assignedOfficers:K,removeOfficer:function(e){W(K.filter((function(t){return t.citizenid!==e})))},readonly:!I,type:"ems",title:D.title}),n.createElement(h.Z,{assignPerson:function(e,t){B([].concat(P(q),[{citizenid:e,name:t}]))},assignedPersons:q,removePerson:function(e){B(q.filter((function(t){return t.citizenid!==e})))},readonly:!I}),n.createElement(E.Z,{isAmbulance:!0,assignVehicle:function(e,t,r){_([].concat(P(Y),[{plate:e.plate,seize:t,fine:parseInt(r)}]))},assignedVehicles:Y,removeVehicle:function(e){_(Y.filter((function(t){return t.plate!==e})))},readonly:!I}))))};function J(e,t){(null==t||t>e.length)&&(t=e.length);for(var r=0,n=new Array(t);r<t;r++)n[r]=e[r];return n}const U=function(e){var t,r,l=(t=(0,n.useState)(0),r=2,function(e){if(Array.isArray(e))return e}(t)||function(e,t){var r=null==e?null:"undefined"!=typeof Symbol&&e[Symbol.iterator]||e["@@iterator"];if(null!=r){var n,o,a=[],i=!0,l=!1;try{for(r=r.call(e);!(i=(n=r.next()).done)&&(a.push(n.value),!t||a.length!==t);i=!0);}catch(e){l=!0,o=e}finally{try{i||null==r.return||r.return()}finally{if(l)throw o}}return a}}(t,r)||function(e,t){if(e){if("string"==typeof e)return J(e,t);var r=Object.prototype.toString.call(e).slice(8,-1);return"Object"===r&&e.constructor&&(r=e.constructor.name),"Map"===r||"Set"===r?Array.from(e):"Arguments"===r||/^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)?J(e,t):void 0}}(t,r)||function(){throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}()),c=l[0],u=l[1];return n.createElement(o.Z,{id:"reports",active:e.active},n.createElement(i.Z,{loadReport:function(e){u(e)},active:"Reports"===e.active,event:"ListEmsReports"}),n.createElement(a.Z,null),n.createElement(z,{loadedReport:c,setLoadedReport:u}),n.createElement(a.Z,null))}},4185:(e,t,r)=>{r.d(t,{Z:()=>o});var n=r(7294);const o=function(e){return n.createElement("div",{className:"item",onClick:e.onClick},n.createElement("div",{className:"item-details-container"},n.createElement("div",{className:"item-detail-header--dashboard"},e.item.title," - ",e.item.type),n.createElement("div",{className:"item-detail-footer--dashboard"},n.createElement("div",{id:"item-id"},"ID: ",e.item.id),n.createElement("div",{id:"expire-time"},e.item.createdbyname," -- ",e.item.date," ago"))))}},3122:(e,t,r)=>{r.d(t,{Z:()=>p}),r(4916),r(4765),r(1249),r(9753),r(2526),r(1817),r(1539),r(2165),r(6992),r(8783),r(3948),r(7042),r(8309),r(1038);var n=r(7294),o=r(6912),a=r(1051),i=r(2053),l=r(1496),c=r(5668),u=r(4185),s=r(4443);function f(e,t){(null==t||t>e.length)&&(t=e.length);for(var r=0,n=new Array(t);r<t;r++)n[r]=e[r];return n}var d=window.locales.reports,m=window.locales;const p=function(e){var t,r,p=(t=(0,s.Z)(e.event,e.event,e.active),r=3,function(e){if(Array.isArray(e))return e}(t)||function(e,t){var r=null==e?null:"undefined"!=typeof Symbol&&e[Symbol.iterator]||e["@@iterator"];if(null!=r){var n,o,a=[],i=!0,l=!1;try{for(r=r.call(e);!(i=(n=r.next()).done)&&(a.push(n.value),!t||a.length!==t);i=!0);}catch(e){l=!0,o=e}finally{try{i||null==r.return||r.return()}finally{if(l)throw o}}return a}}(t,r)||function(e,t){if(e){if("string"==typeof e)return f(e,t);var r=Object.prototype.toString.call(e).slice(8,-1);return"Object"===r&&e.constructor&&(r=e.constructor.name),"Map"===r||"Set"===r?Array.from(e):"Arguments"===r||/^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)?f(e,t):void 0}}(t,r)||function(){throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}()),y=p[0],v=p[1],b=p[2];return n.createElement(o.Z,null,n.createElement(a.Z,null,n.createElement(l.Z,{name:d.title}),n.createElement(i.Z,{placeholder:m.search,value:y,onChange:v})),n.createElement(c.Z,null,b.map((function(t,r){return n.createElement(u.Z,{item:t,key:t.id?t.id:r,onClick:function(){e.loadReport(t.id)}})}))))}}}]);