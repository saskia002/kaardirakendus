//https://leaflet-extras.github.io/leaflet-providers/preview/

// --------------------------------------------------------------- //
// --------------- Layer links and attribution ------------------- //
// --------------------------------------------------------------- //

const osmLink = '<a href="http://openstreetmap.org">OpenStreetMap</a>';
const cartoDB = '<a href="http://cartodb.com/attributions">CartoDB</a>';
// const stamenToner = <a href="http://maps.stamen.com">StamenToner</a>

const osmUrl = "http://tile.openstreetmap.org/{z}/{x}/{y}.png";
const osmAttrib = `&copy; ${osmLink} Contributors`;

const landUrl = "https://{s}.basemaps.cartocdn.com/rastertiles/dark_all/{z}/{x}/{y}.png";
const cartoAttrib = `&copy; ${osmLink} Contributors & ${cartoDB}`;


const osmMap = L.tileLayer(osmUrl, { attribution: osmAttrib });
const landMap = L.tileLayer(landUrl, { attribution: cartoAttrib });


// ---------------------------------------------------- //
// ------------------- Map config --------------------- //
// ---------------------------------------------------- //
// config map
let config = {
  // See siin määrab ära default mapi
  layers: [osmMap],
  minZoom: 5,
  maxZoom: 18,
};

// magnification with which the map will start
const zoom = 8;
// coordinates
const lat = 58.636856;
const lng = 25.334473;

// calling map
const map = L.map("map", config).setView([lat, lng], zoom);
// Scale: imperial (miles) is set to false, only the metric scale is implemented
L.control.scale({imperial: false, maxWidth: 100}).addTo(map);

// osm layer
osmMap.addTo(map);

let baseLayers = {
  "Klassika": osmMap,
  "Dark mode": landMap,
};

L.control.layers(baseLayers).addTo(map);
// ------------------------------------------------------ //
// ---------------------- Sidebar ----------------------- //
// ------------------------------------------------------ //
// sidebar

const menuItems = document.querySelectorAll(".menu-item");
const sidebar = document.querySelector(".sidebar");
const buttonClose = document.querySelector(".close-button");
menuItems.forEach((item) => {
  item.addEventListener("click", (e) => {
    const target = e.target;

    if (
        target.classList.contains("active-item") ||
        !document.querySelector(".active-sidebar")
    ) {
      document.body.classList.toggle("active-sidebar");
    }

    // show content
    showContent(target.dataset.item);
    // add active class to menu item
    addRemoveActiveItem(target, "active-item");
  });
});

// close sidebar when click on close button
buttonClose.addEventListener("click", () => {
  closeSidebar();
});

// remove active class from menu item and content
function addRemoveActiveItem(target, className) {
  const element = document.querySelector(`.${className}`);
  target.classList.add(className);
  if (!element) return;
  element.classList.remove(className);
}

// show specific content
function showContent(dataContent) {
  const idItem = document.querySelector(`#${dataContent}`);
  addRemoveActiveItem(idItem, "active-content");
}

// --------------------------------------------------
// close when click esc
document.addEventListener("keydown", function (event) {
  if (event.key === "Escape") {
    closeSidebar();
  }
});

// close sidebar when click outside
document.addEventListener("click", (e) => {
  if (!e.target.closest(".sidebar")) {
    closeSidebar();
  }
});

// --------------------------------------------------
// close sidebar

function closeSidebar() {
  document.body.classList.remove("active-sidebar");
  const element = document.querySelector(".active-item");
  const activeContent = document.querySelector(".active-content");
  if (!element) return;
  element.classList.remove("active-item");
  activeContent.classList.remove("active-content");
}



// -------------------------------------------------------- //
// --------------- Modify styles for layers --------------- //
// -------------------------------------------------------- //
// function setStyles(selectedLayer) {
//   let sidebar = document.querySelector(".sidebar");
//   let sidebartext = document.querySelector(".sidebar-content");
//   let sidebarelements = document.querySelector(".sidebar svg");
//
//   if (selectedLayer === "Klassika") {
//     sidebar.style.background = "#fff"; // Light color
//     sidebartext.style.color = "black";
//     sidebarelements.style.fill = "#3f3f3f";
//     document.getElementById("dynamic-styles").textContent = ".sidebar::before { background: #64a1e8; }";
//     sidebar.classList.add("klassika");
//     sidebar.classList.remove("dark-mode");
//   } else if (selectedLayer === "Dark mode") {
//     sidebar.style.background = "#415a77"; // Dark color
//     sidebartext.style.color = "#ffffff";
//     sidebarelements.style.fill = "#ccc";
//     document.getElementById("dynamic-styles").textContent = ".sidebar::before { background: #163c48; }";
//     sidebar.classList.add("dark-mode");
//     sidebar.classList.remove("klassika");
//
//     // Additional code for dark mode marker color
//     let markerIcons = document.querySelectorAll(".circle-icon");
//     for (let i = 0; i < markerIcons.length; i++) {
//       markerIcons[i].style.backgroundColor = "purple";
//     }
//   }
// }
//
// map.on("baselayerchange", function(event) {
//   let selectedLayer = event.name;
//   setStyles(selectedLayer);
// });
//
// // Set initial styles when the page loads
// document.addEventListener("DOMContentLoaded", function() {
//   setStyles("Klassika");
// });




// ------------------------------------------------------------ //
// ------------------ Marker/Cluster config ------------------- //
// ------------------------------------------------------------ //

// L.MarkerClusterGroup extends L.FeatureGroup
// by clustering the markers contained within
const markers = L.markerClusterGroup({
  spiderfyOnMaxZoom: true, // Disable spiderfying behavior
  showCoverageOnHover: false, // Disable cluster spiderfier polygon

});

// Create a custom divIcon with a small circle
function createCustomDivIcon() {
  return L.divIcon({
    className: 'custom-div-icon',
    html: '<div class="circle-icon"></div>',
    iconSize: [12, 12],
  });
}



// ------------------------------------------------------- //
// --------------- Load Markers to the map --------------- //
// ------------------------------------------------------- //


function loadMarkers() {
  fetch('http://localhost:8080/v1/stage')
    .then(response => response.json())
    .then(markerData => {
      markerData.forEach(data => {
        const { latitude, longitude, name, stageData, address } = data;

        // Find the specific data you want for the main popup body
        const ajaluguData = stageData.find(item => item.type === 'Ajalugu');
        const kunaEhitatiData = stageData.find(item => item.type === 'Kuna ehitati');
        const mootmiseKuupaevData = stageData.find(item => item.type === 'Mõõtmise kuupäev');
        const sygavusData = stageData.find(item => item.type === 'Sügavus');
        const kesEhitasData = stageData.find(item => item.type === 'Kes ehitas');
        const helitugevuseData = stageData.find(item => item.type === 'Helitugevuse mõõtmine');
        const laiusData = stageData.find(item => item.type === 'Laius');
        const astmeteArvData = stageData.find(item => item.type === 'Astmete arv');

        // Create a marker with the custom divIcon
        const marker = L.marker(new L.LatLng(latitude, longitude), {
          icon: createCustomDivIcon(),
        });

        // Create the popup content for the main popup body
        const popupContent = document.createElement('div');
        const titleElement = document.createElement('h3');
        titleElement.textContent = name;
        popupContent.appendChild(titleElement);

        
        // Add Address data to the main popup body
        if (address) {
          const addressElement = document.createElement('p');
          addressElement.textContent = `Aadress: ${address}`;
          popupContent.appendChild(addressElement);
        }

        // Add Ajalugu data to the main popup body
        if (ajaluguData) {
          const ajaluguElement = document.createElement('p');
          ajaluguElement.textContent = `${ajaluguData.type}: ${ajaluguData.value}`;
          popupContent.appendChild(ajaluguElement);
        }

        // Add Kuna ehitati data to the main popup body
        if (kunaEhitatiData) {
          const kunaEhitatiElement = document.createElement('p');
          kunaEhitatiElement.textContent = `${kunaEhitatiData.type}: ${kunaEhitatiData.value}`;
          popupContent.appendChild(kunaEhitatiElement);
        }

        // Add Kes ehitas data to the main popup body
        if (kesEhitasData) {
          const kesEhitasElement = document.createElement('p');
          kesEhitasElement.textContent = `${kesEhitasData.type}: ${kesEhitasData.value}`;
          popupContent.appendChild(kesEhitasElement);
        }

        /*// Add Mõõtmise kuupäev data to the main popup body
        if (mootmiseKuupaevData) {
          const mootmiseKuupaevElement = document.createElement('p');
          mootmiseKuupaevElement.textContent = `${mootmiseKuupaevData.type}: ${mootmiseKuupaevData.value}`;
          popupContent.appendChild(mootmiseKuupaevElement);
        }*/

        // Add Sügavus data to the main popup body
        if (sygavusData) {
          const sygavusElement = document.createElement('p');
          sygavusElement.textContent = `${sygavusData.type}: ${sygavusData.value}`;
          popupContent.appendChild(sygavusElement);
        }

        // Add Laius data to the main popup body
        if (laiusData) {
          const laiusElement = document.createElement('p');
          laiusElement.textContent = `${laiusData.type}: ${laiusData.value}`;
          popupContent.appendChild(laiusElement);
        }

        // Add Address data to the main popup body
        if (astmeteArvData) {
          const astmeteArvElement = document.createElement('p');
          astmeteArvElement.textContent = `${astmeteArvData.type}: ${astmeteArvData.value}`;
          popupContent.appendChild(astmeteArvElement);
        }

        if (helitugevuseData) {
          helitugevuseData.value.forEach(suundData => {
            if (suundData.type === 'laululava ava suund') {
              const helitugevuseElement = document.createElement('p');
              helitugevuseElement.textContent = `Laululava ava suund: ${suundData.value}`;
              popupContent.appendChild(helitugevuseElement);
            }})
        }





        // Create a button for the nested popup
        const nestedPopupButton = document.createElement('button');
        nestedPopupButton.textContent = 'Mõõtmistulemused';
        nestedPopupButton.className = 'nested-popup-button'; // Apply the CSS class

        nestedPopupButton.addEventListener('click', () => {
          openNestedPopup(data);
        });

        popupContent.appendChild(nestedPopupButton);

        // Create the Leaflet popup for the main popup body
        const popup = L.popup().setContent(popupContent);

        // Bind the popup to the marker and set the content
        marker.bindPopup(popup);

        // Add the marker to the marker cluster group
        markers.addLayer(marker);
      });

      // Add the marker cluster group to the map after all markers are loaded
      map.addLayer(markers);
    })
    .catch(error => {
      console.error('Error fetching marker data:', error);
    });
}

function openNestedPopup(data) {
  const { stageData, latitude, longitude } = data;

  const helitugevuseData = stageData.find(item => item.type === 'Helitugevuse mõõtmine');
  const ilmData = stageData.find(item => item.type === 'Ilm');
  const mootmiseKpData = stageData.find(item => item.type === 'Mõõtmise kuupäev');
  const tuulData = stageData.find(item => item.type === 'Tuul');
  const suundData = stageData.find(item => item.type === 'laululava ava suund');

  let nestedPopupContent = '<h3>Ilm</h3>';
  if (mootmiseKpData){
    nestedPopupContent += `<p>${mootmiseKpData.type}: ${mootmiseKpData.value}</p>`;
  }
  if(ilmData){
    nestedPopupContent += `<p>${ilmData.type}: ${ilmData.value}</p>`;
  }
  if(tuulData){
    nestedPopupContent += `<p>${tuulData.type}: ${tuulData.value}</p>`;
  }
  if(suundData){
    nestedPopupContent += `<p>${suundData.type}: ${suundData.value}</p>`;
  }

  if (helitugevuseData) {
    nestedPopupContent += '<h3>Helitugevuse mõõtmine</h3>';
    
    helitugevuseData.value.forEach(dBData => {
      if (dBData.type === 'publiku keskel') {
        nestedPopupContent += `<p>Publiku keskel: ${dBData.value} ${dBData.unit}</p>`;
      }})
    helitugevuseData.value.forEach(threeMData => {
      if (threeMData.type === '3m') {
        nestedPopupContent += `<p>${threeMData.type}: ${threeMData.value} ${threeMData.unit}</p>`;
      }})

    helitugevuseData.value.forEach(fiveMData => {
      if (fiveMData.type === '5m') {
        nestedPopupContent += `<p>${fiveMData.type}: ${fiveMData.value} ${fiveMData.unit}</p>`;
      }})
    helitugevuseData.value.forEach(tenMData => {
      if (tenMData.type === '10m') {
        nestedPopupContent += `<p>${tenMData.type}: ${tenMData.value} ${tenMData.unit}</p>`;
      }})

  }
  // Create the Leaflet popup for the nested popup
  const nestedPopup = L.popup()
    .setLatLng([latitude, longitude])
    .setContent(nestedPopupContent)
    .openOn(map);
}

// Call the loadMarkers function when the page loads
window.addEventListener('load', loadMarkers);

// Add all markers to map
map.addLayer(markers);
// ---------------------------------------------------- //
// --------------- Search functionality --------------- //
// ---------------------------------------------------- //

// Searchbox
let searchbox = L.control.searchbox({
  position: 'topright',
  expand: 'left'
}).addTo(map);

// Close and clear searchbox 600ms after pressing "ENTER" in the search box
searchbox.onInput("keyup", function (e) {
  if (e.keyCode === 13) {
    // map.setZoom(11);
    setTimeout(function () {
      searchbox.hide();
      searchbox.clear();
    }, 600);
  }
});

// Close and clear searchbox 600ms after clicking the search button
searchbox.onButton("click", function () {
  setTimeout(function () {
    // map.setZoom(11);
    searchbox.hide();
    searchbox.clear();
  }, 600);
});

searchbox.onInput("keyup", function (e) {
  let value = searchbox.getValue();
  if (value !== "") {
    if (map.getZoom() < 11){
      map.setZoom(11);
    }
    const searchUrl = `http://localhost:8080/v1/stage/searchByName?name=${value}`;

    fetch(searchUrl)
        .then(response => response.json())
        .then(data => {
          const persons = data;

          // Clear the existing dropdown options
          searchbox.clearItems();

          // Add the persons as dropdown options
          persons.forEach(person => {
            // if (person.varjunimi == null) {
              searchbox.addItem(person.eesnimi + " " + person.perekonnanimi);
          //   } else {
          //     searchbox.addItem(person.eesnimi + " " + person.perekonnanimi + " " + person.varjunimi);
          //   }
          });

          // Add click event listener to search result items
          const searchResultItems = searchbox.getValue();

          if (typeof searchResultItems === "string") {
            const selectedValue = searchResultItems;
            const marker = findMarkerByTitle(selectedValue);
            if (marker) {
              const popup = marker.getPopup();
              if (popup) {
                // Check if the marker is part of a cluster
                const cluster = marker.__parent;
                if (cluster) {
                  console.log("Zoom level for search:", map.getZoom());
                  // Zoom to the cluster bounds
                  map.fitBounds(cluster.getBounds());

                  // Open the cluster after zooming
                  setTimeout(() => {
                    cluster.spiderfy();
                  }, 100);

                  // Open the marker's popup after a short delay
                  setTimeout(() => {
                    marker.openPopup();
                  }, 200);
                } else {
                  // Center the map on the marker and open the popup
                  map.setView(marker.getLatLng(), map.getMaxZoom());
                  marker.openPopup();
                }
              }
              // else {
              //   // console.error('Popup not found for marker:', marker);
              // }
            } else {
              console.error('Marker not found for title:', selectedValue);
            }
          } else if (Array.isArray(searchResultItems)) {
            // Handle multiple search result items if needed
            // ...
          }
        })
        .catch(error => {
          console.error(error);
        });
  } else {
    searchbox.clearItems();
  }
});



function findMarkerByTitle(title) {
  const markerData = markers.getLayers();
  // console.log("findMarkerByTitle method log: " + markerData);
  for (const marker of markerData) {
    // console.log(marker.options.title)
    // see töötab, leiab inimese nimed (title) üles
    if (marker.options.title === title) {
      return marker;
    }
  }
  return null;
}

// center the map when popup is clicked
function clickZoom(e) {
  const marker = e.target;

  if (!marker.__parent) {
    // Marker is not part of a cluster
    map.setView(cluster.getLatLng(), map.getMaxZoom() + 3);
  }
}



// ---------------------------------------------------- //
// --------------- Back to home button ---------------- //
// ---------------------------------------------------- //
const htmlTemplate = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"><path d="M32 18.451L16 6.031 0 18.451v-5.064L16 .967l16 12.42zM28 18v12h-8v-8h-8v8H4V18l12-9z" /></svg>';
// const htmlTemplate = 'img/search_icon.png'

// create custom button
const customControl = L.Control.extend({
  // button position
  options: {
    position: "topleft",
  },

  // method
  onAdd: function (map) {
    console.log(map.getCenter());
    // create button
    const btn = L.DomUtil.create("button");
    btn.title = "tagasi algusesse";
    btn.innerHTML = htmlTemplate;
    btn.className += "leaflet-bar back-to-home hidden";

    return btn;
  },
});

// adding new button to map control
map.addControl(new customControl());

// on drag end
map.on("moveend", getCenterOfMap);

const buttonBackToHome = document.querySelector(".back-to-home");

function getCenterOfMap() {
  buttonBackToHome.classList.remove("hidden");

  buttonBackToHome.addEventListener("click", () => {
    map.flyTo([lat, lng], zoom);
  });

  map.on("moveend", () => {
    const { lat: latCenter, lng: lngCenter } = map.getCenter();

    const latC = latCenter.toFixed(3) * 1;
    const lngC = lngCenter.toFixed(3) * 1;

    const defaultCoordinate = [+lat.toFixed(3), +lng.toFixed(3)];

    const centerCoordinate = [latC, lngC];

    if (compareToArrays(centerCoordinate, defaultCoordinate)) {
      buttonBackToHome.classList.add("hidden");
    }
  });
}

const compareToArrays = (a, b) => JSON.stringify(a) === JSON.stringify(b);


// ---------------------------------------------------- //
// ---------------------- MiniMap --------------------- //
// ---------------------------------------------------- //
// MiniMap
const osm2 = new L.TileLayer(osmUrl, { minZoom: 0, maxZoom: 13});
const miniMap = new L.Control.MiniMap(osm2, { toggleDisplay: true }).addTo(map);



// ---------------------------------------------------- //
// ----------------------- Email ---------------------- //
// ---------------------------------------------------- //

// Add an event listener to the form submission
document.getElementById('emailForm').addEventListener('submit', function(event) {
  event.preventDefault(); // Prevent the default form submission behavior

  const name = document.getElementById('name').value;
  const subject = document.getElementById('subject').value;

  // Create an object with the necessary data from your form
  const emailRequest = {
    recipient: '1521e4565f2885@inbox.mailtrap.io',
    name: name,
    subject: subject
  };
  console.log(emailRequest)

  // Send the POST request to the backend
  fetch('http://localhost:8080/api/v1/email/sendEmail', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(emailRequest)
  })
      .then(response => {
        if (response.ok) {
          console.log('Email sent successfully');
          alert('Email sent successfully!');
        } else {
          console.log(response)
          console.log('Failed to send email');
          alert('Failed to send email. Please try again later.');
        }
      })
      .catch(error => {
        console.error('Error:', error);
        alert('An error occurred while sending the email. Please try again later.');
      });
});


document.addEventListener("visibilitychange", function() {
  if (document.visibilityState === 'hidden') {
} 
  else {
}
});