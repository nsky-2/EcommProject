			var modal = document.getElementById('myModal');
			var btn = document.getElementById("myBtn");
			var span = document.getElementsByClassName("close")[0];
			var nex = document.getElementsByClassName("join-now")[0];
			btn.onclick = function() {
				modal.style.display = "block";
			}
			span.onclick = function() {
				modal.style.display = "none";
			}
			
			nex.onclick = function() {
				var modal1 = document.getElementById('myModal1');
				var span1 = document.getElementsByClassName("close1")[0];
				modal.style.display = "none";
				modal1.style.display= "block";
				span1.onclick = function() {
					modal1.style.display = "none";
					modal.style.display = "none";	
				}
				window.onclick = function(event) {
					if (event.target == modal1) {
						modal1.style.display = "none";
						modal.style.display = "none";	
					}
				}
			}
			window.onclick = function(event) {
				if (event.target == modal) {
					modal.style.display = "none";
				}
			}
			