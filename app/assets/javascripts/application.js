// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require quagga
//= require_tree .



// some code is from barcode https://www.youtube.com/watch?v=qzbHxlQAa5o, implementing quagga in your rails application,

function order_by_occurrence(arr) {
  var counts = {};
  arr.forEach(function(value){
      if(!counts[value]) {
          counts[value] = 0;
      }
      counts[value]++;
  });

  return Object.keys(counts).sort(function(curKey,nextKey) {
      return counts[curKey] < counts[nextKey];
  });
}

function load_quagga(){
  if ($('#barcode-scanner').length > 0 && navigator.mediaDevices && typeof navigator.mediaDevices.getUserMedia === 'function') {

  // set last result as an empty array 
    var last_result = [];
    
   
    if (Quagga.initialized == undefined) {
      
      // on Detected listener to pass the funtion result
      Quagga.onDetected(function(result) {
        var last_code = result.codeResult.code;
        
        
        last_result.push(last_code);
        if (last_result.length > 25) {
          code = order_by_occurrence(last_result)[0];
          last_result = [];
          Quagga.stop();
          
          // ajax post
          $.ajax({
            type: "POST",
            url: '/wines/get_barcode',
            data: { upc: code }
          });
        }
      });
    }

// inizialize quagga
    Quagga.init({
      inputStream : {
        name : "Live",
        type : "LiveStream",
        numOfWorkers: navigator.hardwareConcurrency,
        target: document.querySelector('#barcode-scanner')  
      },
      decoder: {
        // different kind of barcode that are support in the application
          readers : ['ean_reader','ean_8_reader','code_39_reader','code_39_vin_reader','codabar_reader','upc_reader','upc_e_reader']
      }
    },function(err) {
        if (err) { console.log(err); return }
        
         //switch to avoid onDetected listener to inicialize multiple times  to start more than once
        Quagga.initialized = true;
        Quagga.start();
    });

  }
};
$(document).on('turbolinks:load', load_quagga);