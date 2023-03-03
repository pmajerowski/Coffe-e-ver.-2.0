document.addEventListener("DOMContentLoaded", function (event) {
    const coffee = document.getElementsByName('coffeeId')[0];
    const brewTypes = document.getElementById('brewTypeId');
    const brewMethods = document.getElementById('brewMethodId');
    const selectedBrewTypeId = document.querySelector('#selectedBrewTypeId');
    const selectedBrewMethodId = document.querySelector('#selectedBrewMethodId');


    fetch('../get/brewTypes/coffee/'+coffee.value)
        .then(response => response.json())
        .then(function(json) {
            for(let i = 0; i < json.length; i++) {
                let obj = json[i];
                const brewType = document.createElement('option')
                brewType.innerText = obj.name;
                brewType.setAttribute("value", obj.id);

                if(obj.id == selectedBrewTypeId.value) {
                    brewType.selected = true;
                }
                brewTypes.appendChild(brewType);
            }

            brewMethods.replaceChildren();
            const brewTypesChange = document.getElementsByName('brewTypeId')[0];

            fetch('/get/brewMethods/brewType/'+brewTypesChange.value)
                .then(response => response.json())
                .then(function(json) {
                    for(let i = 0; i < json.length; i++) {
                        let method = json[i];
                        const brewMethod = document.createElement('option')
                        brewMethod.innerText = method.name;
                        if(method.id == selectedBrewMethodId.value) {
                            brewMethod
                                .selected = true;
                        }
                        brewMethod.setAttribute("value", method.id);
                        brewMethods.appendChild(brewMethod);
                    }
                });
        });

    coffee.addEventListener('change', function (event) {
        brewTypes.replaceChildren();
        brewMethods.replaceChildren();

        fetch('../get/brewTypes/coffee/'+coffee.value)
            .then(response => response.json())
            .then(function(json) {
                const firstTypeId = json[0].id;
                for(let i = 0; i < json.length; i++) {
                    let type = json[i];
                    const brewType = document.createElement('option');
                    brewType.innerText = type.name;

                    brewType.setAttribute("value", type.id);
                    brewTypes.appendChild(brewType);
                }

                fetch('/get/brewMethods/brewType/'+firstTypeId)
                    .then(response => response.json())
                    .then(function(json) {
                        for(let i = 0; i < json.length; i++) {
                            let method = json[i];
                            const brewMethod = document.createElement('option')
                            brewMethod.innerText = method.name;

                            brewMethod.setAttribute("value", method.id);
                            brewMethods.appendChild(brewMethod);
                        }

                    });
            });
    });

    brewTypes.addEventListener('change', function (event) {
        brewMethods.replaceChildren();
        const brewTypesChange = document.getElementsByName('brewTypeId')[0];

        fetch('/get/brewMethods/brewType/'+brewTypesChange.value)
            .then(response => response.json())
            .then(function(json) {
                for(let i = 0; i < json.length; i++) {
                    let method = json[i];
                    const brewMethod = document.createElement('option')
                    brewMethod.innerText = method.name;
                    brewMethod.setAttribute("value", method.id);
                    brewMethods.appendChild(brewMethod);
                }

            });
    });

});