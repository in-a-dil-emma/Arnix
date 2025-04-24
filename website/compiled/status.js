var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
function replaceTemporaryFields() {
    return __awaiter(this, void 0, void 0, function* () {
        var ticker = document.getElementById("ticker");
        const stabledata = yield fetch('https://api.github.com/repos/GermanBread/Arnix/releases/latest');
        const stablejson = yield stabledata.json();
        ticker.innerHTML = ticker.innerHTML.replace("%s", stablejson.tag_name.link(stablejson.html_url));
        const devdata = yield fetch('https://api.github.com/repos/GermanBread/Arnix/commits/dev');
        const devjson = yield devdata.json();
        ticker.innerHTML = ticker.innerHTML.replace("%g", devjson.sha.link(devjson.html_url));
    });
}
