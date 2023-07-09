var LocalURL = '../';
var correctImg = LocalURL + 'public/icon/checked.svg';
var incorrectImg = LocalURL + 'public/icon/unchecked.svg';
var emptyImg = LocalURL + 'public/icon/hint.svg';
var loadingImg = LocalURL + 'public/icon/loading.svg';
var STRENGTH_BAR_EXTENSION = 'ProgBar';
var TIPS_EXTENSION = 'Tips';
var SHOW_ERROR_CLASS = 'tipsHover';

class Condition {
    constructor(regexp, should) {
        this.regexp = regexp;
        this.should = should;
    }
    
    test(inp) {
        return this.regexp.test(inp) == this.should;
    }
}

class TextCondition extends Condition {
    constructor(regexp, flagMsg, should, makeChange) {
        super(regexp, should);
        this.flagMsg = flagMsg;
        this.makeChange = makeChange;
    }
    
    getMatched(inp) {
        while (!super.test(inp))
            inp = inp.slice(0, -1);
        return inp;
    }
}

class PasswordCondition extends Condition {
    constructor(regexp, score) {
        super(regexp, true);
        this.score = score;
    }
    
    evaluate(inp) {
        return this.score[super.test(inp) ? 1 : 0];
    }
    
    getScore() {
        return this.score[1];
    }
}

var Msg = {
    PASSWORD: {
        EMPTY: "empty password",
        WEAK: "weak password",
        FINE: "fine"
    },
    CONF_PASSWORD: {
        EMPTY: "empty confirm",
        NOT_MATCHED: "not matched",
        MATCHED: "ok,, matched"
    },
    USERNAME: {
        EMPTY: "empty username",
        FINE: "fine username",
        END_WITH_DOT: "an username can't end with '.'",
        START_WITH_DOT: "an username can't start with '.'",
        START_WITH_NUMBER: "an username can't start with number",
        INVALID_FORMAT: "Only English alphabet and numbers are allowed",
        TWO_CONSECUTIVE_DOTS: "two consecutive dots aren't allowed",
        TAKEN_USERNAME: "this username is unavailable"
    },
    NAME: {
        EMPTY: "empty name",
        FINE: "fine name",
        INVALID_FORMAT: "Only English alphabet and spaces are allowed",
        TWO_CONSECUTIVE_SPACES: "two consecutive spaces aren't allowed"
    },
    PHONE: {
        EMPTY: "optinal phone",
        NOT_START_09: "phone number should start with 09",
        INVALID_FORMAT1: "phone number cant start with 091, 092 or 097",
        INVALID_FORMAT2: "phone number should only contains digit number",
        MAX_LENGTH: "phone number should be 10 digits",
        FINE: "fine number"
    }
};

var INPUT = {
    NAME: [
        new TextCondition(RegExp(/^.*[^a-zA-Z0-9 ].*$/), 'SYMB', false, true),
        new TextCondition(RegExp(/^.*[0-9].*$/), 'NUMBER', false, true),
        new TextCondition(RegExp(/^([a-zA-Z ]){1,2}$/), 'SHORT', false, false),
        new TextCondition(RegExp(/^[a-zA-Z ]{40,}$/), 'LONG', false, true),
    ],
    USERNAME: [
        new TextCondition(RegExp(/^$/), 'EMPTY<br/><br>\n\<br>dsdsdsdsd sdsd ssdds <br> dsdsd <br>dsdsdsds', false, false),
        new TextCondition(RegExp(/^.*[^a-z0-9\.].*$/), 'SYMB', false, true),
        new TextCondition(RegExp(/^.*\.$/), 'END_DOT', false, false),
        new TextCondition(RegExp(/^\..*$/), 'START_DOT', false, true),
        new TextCondition(RegExp(/^([a-zA-Z ]){1,2}$/), 'SHORT', false, false),
        new TextCondition(RegExp(/^.*\.\..*$/), 'TWO_DOTS', false, true),
        new TextCondition(RegExp(/^[a-zA-Z ]{40,}$/), 'LONG', false, true),
    ],
    PHONE: [
        new TextCondition(RegExp(/^[0-9]{1,9}$/), 'LENGTH', false, false),
        new TextCondition(RegExp(/^[0-9]{11,}$/), 'MAX_LENGTH', false, true),
        new TextCondition(RegExp(/^[^0].*/), 'START0', false, true),
        new TextCondition(RegExp(/^0[^9].*/), 'START09', false, true),
        new TextCondition(RegExp(/^09[^345689].*/), 'START09X', false, true),
        new TextCondition(RegExp(/^.*[^0-9].*/), 'SYMB', false, true),
    ],
    PASSWORD: [
        new PasswordCondition(RegExp(/^.*[a-z].*$/), [0, 1]),
        new PasswordCondition(RegExp(/^.*[A-Z].*$/), [0, 1]),
        new PasswordCondition(RegExp(/^.*[0-9].*$/), [0, 1]),
        new PasswordCondition(RegExp(/^.*[!\.@#$%^&*].*$/), [0, 1]),
    ],
    PASSWORD2: [
        new PasswordCondition(RegExp(/^.*[!\.@#$%^&*].*[!\.@#$%^&*].*$/), [0, 1]),
        new PasswordCondition(RegExp(/^.*[A-Z].*[A-Z].*$/), [0, 1]),
        new PasswordCondition(RegExp(/^.*[0-9].*[0-9].*$/), [0, 1]),
        new PasswordCondition(RegExp(/^.*[!\.@#$%^&*].*[!\.@#$%^&*].*[!\.@#$%^&*].*$/), [0, 1]),
    ],
    
    NORMAL: []
};

var STRENGTH_COLOR = [
    '#ff0000', '#d02d00', '#e46700',
    '#d59100', '#d2d500', '#84c200',
    '#4bbd00', '#00d000'
];


function __setValidation(id, msg, img, shake) {
    $('#' + id + 'Img').attr('src', img);
    $('#' + id + TIPS_EXTENSION).html(msg);
    if (shake) {
        $('#' + id + 'Input').addClass('shakeElementAnimate');
        setTimeout(() => {
            $('#' + id + 'Input').removeClass('shakeElementAnimate');
        }, 600);
        setTimeout(() => {
            $('#' + id + TIPS_EXTENSION).addClass(SHOW_ERROR_CLASS);
        }, 300);
    }
}


function checkTextInput(id, type, isFinal) {
    cleanSpaces = v => v.replace(/  +/g, ' ');
    cleanDashes = v => v.replace(/[-]/g, '');
    addDashes = v => v.slice(0, 4) + (v.length > 4 ? '-' : '') + v.slice(4, 7) + (v.length > 7 ? '-' : '') + v.slice(7);
    
    var fine = true;
    var v = cleanSpaces($('#' + id).val());
    if (type == 'PHONE')
        v = cleanDashes(v);
    __setValidation(id, Msg[type].FINE, correctImg, false);
    if (isFinal)
        v = v.trim();
    for (cdt of INPUT[type])
        if (!cdt.test(v)) {
            fine = false;
            __setValidation(id, cdt.flagMsg, incorrectImg, cdt.makeChange);
            if (cdt.makeChange) {
                v = cdt.getMatched(v);
                if (isFinal)
                    v = v.trim();
            }
        }
    
    if (type == 'PHONE')
        v = addDashes(v);
    $('#' + id).val(v);
    $('#' + id).attr('value', v);
    return fine;
}

function checkEmptyInput(id) {
    if ($('#' + id).val().length == 0) {
        __setValidation(id, 'REQUIERD', incorrectImg, true);
        return false;
    }
    return true;
}

function evaluateStrength(id) {
    v = $('#' + id).val();
    $('#' + id).attr('value', v);
    var score = 0;
    var total = 0;
    
    for (cdt of INPUT['PASSWORD']) {
        score += cdt.evaluate(v);
        total += cdt.getScore();
    }
    for (cdt of INPUT['PASSWORD2']) {
        if (score >= 4)
            score += cdt.evaluate(v);
        total += cdt.getScore();
    }
    
    if (score < 0) {
        score = 0; // too long password
    }
    console.log(score);
    console.log(total);
    var rat = 100 * score / total;
    $('#' + id + STRENGTH_BAR_EXTENSION)
        .css({
            'width': rat + '%',
            'background-color': STRENGTH_COLOR[Math.max(Math.min(score - 1, 7), 0)]
        });
    if (score == 0) {
        __setValidation(id, Msg.PASSWORD.EMPTY, incorrectImg, false);
    } else if (score >= 4) {
        __setValidation(id, Msg.PASSWORD.FINE, correctImg, false);
    } else {
        __setValidation(id, Msg.PASSWORD.WEAK, incorrectImg, false);
    }
    return score >= 4;
}

function passwordMatching(passwordId, confPasswordId, final) {
    var passwordStr = $('#' + passwordId).val();
    if (confPasswordId != undefined) {
        var confPasswordStr = $('#' + confPasswordId).val();
        $('#' + confPasswordId).attr('value', confPasswordStr);
        
        if (confPasswordStr.length == 0) {
            __setValidation(confPasswordId, Msg.CONF_PASSWORD.EMPTY, incorrectImg, final)
            return false;
        }
        
        if (passwordStr == confPasswordStr) {
            __setValidation(confPasswordId, Msg.CONF_PASSWORD.MATCHED, correctImg, false)
            return true;
        }
        __setValidation(confPasswordId, Msg.CONF_PASSWORD.NOT_MATCHED, incorrectImg, final)
    }
    return false;
}

function checkPasswordInput(passwordId, confPasswordId, final) {
    var ret = true;
    if (passwordId != undefined)
        ret = evaluateStrength(passwordId);
    if (confPasswordId != undefined)
        ret = passwordMatching(passwordId, confPasswordId, final) & ret;
    return ret;
}

function hideErrors(id) {
    $('#' + id)
        .on('input',
            e => {
                $('#' + id + TIPS_EXTENSION)
                    .removeClass(SHOW_ERROR_CLASS)
            }
        );
    
    $('#' + id)
        .focusout(
            () => {
                $('#' + id + TIPS_EXTENSION)
                    .removeClass(SHOW_ERROR_CLASS)
            }
        );
}

function initializeInputValidator(id, type) {
    hideErrors(id);
    $('#' + id)
        .on('input', e => checkTextInput(e.target.id, type, false));
}

function preventQuickAction(id, submitBtnIdJs) {
    if (id != undefined)
        $('#' + id)
            .on('keydown',
                e => {
                    if (e.keyCode == 13) {
                        e.preventDefault();
                        $("#" + submitBtnIdJs)
                            .click();
                    }
                }
            );
}

function initializePasswordInputValidator(passwordId, confPasswordId) {
    for (id of [passwordId, confPasswordId]) {
        if (id != undefined) {
            hideErrors(id);
            $('#' + id).on('input', e => checkPasswordInput(passwordId, confPasswordId, false));
        }
    }
}

function initializeFormValidator(submitBtnIdJs, submitBtnIdServer, fields, fromId) {
    
    for ([type, details] of Object.entries(fields)) {
        if (type == 'PASSWORD')
            for (passwrodIds of details) {
                preventQuickAction(passwrodIds.passwordId, submitBtnIdJs);
                preventQuickAction(passwrodIds.confPasswordId, submitBtnIdJs);
                initializePasswordInputValidator(passwrodIds.passwordId, passwrodIds.confPasswordId);
            }
        else
            for (detail of details) {
                preventQuickAction(detail.id, submitBtnIdJs);
                initializeInputValidator(detail.id, type);
            }
    }
    $("#" + submitBtnIdJs)
        .click(
            () => {
                var fine = true;
                for ([type, details] of Object.entries(fields))
                    if (type == 'PASSWORD')
                        for (passwrodIds of details) {
                            fine = checkPasswordInput(passwrodIds.passwordId, passwrodIds.confPasswordId, true) && fine;
                            fine = checkEmptyInput(passwrodIds.passwordId) && fine;
                            if (passwrodIds.confPasswordId != undefined)
                                fine = checkEmptyInput(passwrodIds.confPasswordId) && fine;
                        }
                    else
                        for (detail of details) {
                            fine = checkTextInput(detail.id, type, true) && fine;
                            if (detail.require)
                                fine = checkEmptyInput(detail.id) && fine;
                        }
                // fine = true;
                if (fine) {
                    $('#' + submitBtnIdServer)
                        .click();
                }
            }
        );
}

function initializeInteractiveChecker(id, type, successMsg, failMsg, manipulateInput, urlPHP, indexGET) {
    $('#' + id).on('input',
        function (e) {
            if (checkTextInput(id, type, false)) {
                clearTimeout($.data(this, 'timerAjaxCallIntCheck'));
                var _data = {};
                _data[indexGET] = manipulateInput($(this).val());
                $.data(this, 'timerAjaxCallIntCheck',
                    setTimeout(
                        () => {
                            __setValidation(id, 'LOADING', loadingImg, false);
                            $.get(urlPHP, _data, function (res) {
                                if (res.res == true) {
                                    __setValidation(id, res.msg, correctImg, false);
                                } else {
                                    __setValidation(id, res.msg, incorrectImg, false);
                                }
                            });
                        },
                        1000
                    )
                );
            }
        }
    );
}

