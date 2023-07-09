$(document).ready(
    () => {
        $('.button')
            .on('mousedown',
                (e) => {
                    let posX = e.offsetX;
                    let posY = e.offsetY;
                    element = document.querySelector('#' + e.currentTarget.id);
                    element.style.setProperty('--x', posX + 'px');
                    element.style.setProperty('--y', posY + 'px');

                    setTimeout(
                        () => {
                            $('#' + e.currentTarget.id)
                                .addClass('pulse')
                                .data('Timer', true);
                        }, 1
                    );

                    setTimeout(
                        () => {
                            $('#' + e.currentTarget.id)
                                .data('Timer', false);
                        }, 120
                    );

                    function close(event) {

                        let posX = event.offsetX;
                        let posY = event.offsetY;
                        element = document.querySelector('#' + e.currentTarget.id);
                        element.style.setProperty('--x', posX + 'px');
                        element.style.setProperty('--y', posY + 'px');

                        timer = $('#' + e.currentTarget.id)
                            .data('Timer');
                        if (!timer) {
                            $('#' + e.currentTarget.id)
                                .removeClass('pulse');
                        } else {
                            setTimeout(
                                () => {
                                    $('#' + e.currentTarget.id)
                                        .removeClass('pulse');
                                }, 120
                            );
                        }
                    }

                    $('#' + e.currentTarget.id)
                        .on('mouseup', close)
                        .on('mouseleave', close);
                });
    }
);