window.onload = function () {
		    document.getElementById("pCountry").addEventListener("change", loadMyPackagesByCountry);
		  };
		
		  function loadMyPackagesByCountry() {
		    const country = document.getElementById("pCountry").value;
		
		    if (!country) {
		      document.getElementById("pNum").innerHTML = "<option value=''>패키지 선택</option>";
		      return;
		    }
		
		    const xhr = new XMLHttpRequest();
		    xhr.open("GET", "/api/orderedPackagesByCountry?country=" + encodeURIComponent(country), true);
		    xhr.onreadystatechange = function () {
		      if (xhr.readyState === 4 && xhr.status === 200) {
		        const packageSelect = document.getElementById("pNum");
		        packageSelect.innerHTML = "<option value=''>패키지 선택</option>";
		        const packages = JSON.parse(xhr.responseText);
		        packages.forEach(pkg => {
		          const option = document.createElement("option");
		          option.value = pkg.pNum;
		          option.text = pkg.pName + " (" + pkg.pCountry + ")";
		          packageSelect.appendChild(option);
		        });
		      }
		    };
		    xhr.send();
		  }