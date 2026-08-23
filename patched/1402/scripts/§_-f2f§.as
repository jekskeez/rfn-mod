package
{
   import §_-bN§.§_-U2h§;
   import §_-k22§.§_-8P§;
   import §_-k22§.§_-H2o§;
   import §_-k22§.§_-I1U§;
   import §_-k22§.§_-O1§;
   import §_-k22§.§_-Yl§;
   import §_-k22§.§_-tk§;
   import by.blooddy.crypto.CRC32;
   import com.ApiConfig;
   import com.api.Player;
   import com.utils.StringUtil;
   import flash.display.LoaderInfo;
   import flash.utils.ByteArray;
   
   public class §_-f2f§ extends ApiConfig
   {
      
      public function §_-f2f§(param1:Object, param2:LoaderInfo)
      {
         var parameters:Object = param1;
         var loaderInfo:LoaderInfo = param2;
         super();
         this.parameters = parameters;
         this.loaderInfo = loaderInfo;
         applicationName = gls("Трагедия белок");
         noName = gls("Без имени");
         screenshotUploadUrl = §_-Zy§.§_-q2b§;
         photoSaveUrl = §_-Zy§.§_-c11§;
         defaultPhoto = new NonPhotoImage();
         defaultApi = §_-Zy§.§_-R1A§;
         playerClass = Player;
         emailDialog = §_-U2h§;
         vk_type = §_-Zy§.§_-Q1M§;
         vk_savePhoto = false;
         vk_copyFields = ["name","sex"];
         vk_saveFields = ["profile","bdate","photo_big","city","country"];
         vk_groupAddress = "https://vk.com/belkigame";
         vk_bankDialog = §_-H2o§;
         vk_appAddress = "https://vk.com/squirrels_game";
         vk_likesAddress = "https://vk.com/app2404568";
         vk_groupId = 28538688;
         vk_requestFields = "uid,first_name,sex,bdate,photo_50,screen_name,city,country";
         vk_photoUrl = "photo_50";
         fb_type = §_-Zy§.§_-s12§;
         fb_savePhoto = false;
         fb_copyFields = ["name","sex"];
         fb_saveFields = ["profile","bdate","photo_big","country"];
         fb_groupAddress = §_-Zy§.§_-BI§ ? "https://www.facebook.com/squirrelstragedy/" : "https://www.facebook.com/belkigame";
         fb_appAddress = §_-Zy§.§_-BI§ ? "https://apps.facebook.com/squirrelstragedy/" : "https://apps.facebook.com/tragedyofsquirrels/";
         fb_groupId = §_-Zy§.§_-BI§ ? "302416696482094" : "137323319735776";
         fb_bankDialog = §_-I1U§;
         fb_inviteFriendMessage = gls("Увлекательная игра Трагедия Белок, присоединяйся!");
         fb_appId = §_-Zy§.§_-01N§;
         fb_requestFields = "id,first_name,last_name,gender,birthday,locale,picture,link,location";
         fb_buy_url = §_-Zy§.§_-i2N§;
         fb_crossAppId = !§_-Zy§.§_-BI§ ? "106813929457679" : "";
         fs_type = §_-Zy§.§_-S2j§;
         fs_savePhoto = false;
         fs_copyFields = ["name","sex"];
         fs_saveFields = ["profile","bdate","photo_big"];
         fs_groupAddress = "https://fotostrana.ru/community/43306/";
         fs_bankDialog = §_-8P§;
         fs_requestFields = "user_name,sex,birthday,photo_big,user_link";
         fs_photoUrl = "photo_small";
         fs_appId = §_-Zy§.§_-32c§;
         fs_secret = §_-Zy§.§_-8J§;
         mm_type = §_-Zy§.§_-32G§;
         mm_savePhoto = false;
         mm_copyFields = ["name","sex"];
         mm_saveFields = ["profile","bdate","photo_big","country"];
         mm_groupAddress = "https://my.mail.ru/community/squirrels_game/";
         mm_groupId = "8847861727607833664";
         mm_bankDialog = §_-tk§;
         mm_appAddress = "https://my.mail.ru/apps/648036";
         mm_secret = §_-Zy§.§_-dV§;
         mm_photoUrl = "pic_small";
         mm_inviteFriendMessage = "Увлекательная игра Трагедия Белок, присоединяйся!";
         ok_type = §_-Zy§.§_-zE§;
         ok_savePhoto = false;
         ok_copyFields = ["name","sex"];
         ok_saveFields = ["profile","bdate","photo_big","country"];
         ok_groupAddress = "https://www.odnoklassniki.ru/group/51869321068777";
         ok_groupId = "52192660979156";
         ok_bankDialog = §_-O1§;
         ok_appAddress = "https://www.odnoklassniki.ru/game/squirrels";
         ok_requestFields = "uid,first_name,name,gender,birthday,location,pic_2,url_profile";
         ok_photoUrl = "pic50x50";
         sa_type = §_-Zy§.§_-nn§;
         sa_savePhoto = false;
         sa_copyFields = ["name","sex","email"];
         sa_saveFields = ["profile","bdate","photo_big"];
         sa_bankDialog = §_-Yl§;
         sa_appId = §_-Zy§.§_-B3T§;
         sa_apiUrl = §_-Zy§.§_-Z1I§;
         payment_currency = §_-Zy§.§_-BI§ ? "RUB" : "USD";
         xsolla_get_token_url = §_-Zy§.§_-r2m§;
         yookassa_get_token_url = §_-Zy§.§_-Y2T§;
         yookassa_payement_url = §_-Zy§.§_-C36§;
         robokassa_get_token_url = §_-Zy§.§_-A1V§;
         robokassa_payement_url = §_-Zy§.§_-214§;
         uploadHandler = function(param1:Player):Boolean
         {
            if(param1.photoBig.indexOf("/saved/") != -1)
            {
               return true;
            }
            var _loc2_:ByteArray = new ByteArray();
            _loc2_.writeUTFBytes(param1.self["photo_big"]);
            var _loc3_:String = §_-Zy§.§_-33D§ + param1.id % §_-Zy§.§_-12p§ + "/" + param1.id + "/" + CRC32.hash(_loc2_) + ".png";
            return param1.photoBig != _loc3_;
         };
         nameStripFunction = function(param1:String):String
         {
            param1 = StringUtil.stripHTML(param1);
            param1 = param1.replace(new RegExp(/[^a-zA-Z0-9а-яА-ЯёЁ \]\[]/g),"");
            param1 = param1.substr(0,15);
            if(/^ +$/.test(param1))
            {
               return "";
            }
            return param1;
         };
      }
   }
}

