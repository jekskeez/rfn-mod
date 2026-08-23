package
{
   import §_-C1M§.§_-Cq§;
   import §_-C1M§.§_-Pq§;
   import §_-C1M§.§_-S0§;
   import §_-C1M§.§_-W2a§;
   import §_-C1M§.§_-X2r§;
   import §_-C1M§.§_-rb§;
   import §_-k1c§.§_-A27§;
   import by.blooddy.crypto.CRC32;
   import com.ApiConfig;
   import com.api.Player;
   import com.utils.StringUtil;
   import flash.display.LoaderInfo;
   import flash.utils.ByteArray;
   
   public class §_-AU§ extends ApiConfig
   {
      
      public function §_-AU§(param1:Object, param2:LoaderInfo)
      {
         var parameters:Object = param1;
         var loaderInfo:LoaderInfo = param2;
         super();
         this.parameters = parameters;
         this.loaderInfo = loaderInfo;
         applicationName = gls("Трагедия белок");
         noName = gls("Без имени");
         screenshotUploadUrl = §_-a9§.§_-ru§;
         photoSaveUrl = §_-a9§.§_-Z2l§;
         defaultPhoto = new NonPhotoImage();
         defaultApi = §_-a9§.§_-63Z§;
         playerClass = Player;
         emailDialog = §_-A27§;
         vk_type = §_-a9§.§_-JO§;
         vk_savePhoto = false;
         vk_copyFields = ["name","sex"];
         vk_saveFields = ["profile","bdate","photo_big","city","country"];
         vk_groupAddress = "https://vk.com/belkigame";
         vk_bankDialog = §_-W2a§;
         vk_appAddress = "https://vk.com/squirrels_game";
         vk_likesAddress = "https://vk.com/app2404568";
         vk_groupId = 28538688;
         vk_requestFields = "uid,first_name,sex,bdate,photo_50,screen_name,city,country";
         vk_photoUrl = "photo_50";
         fb_type = §_-a9§.§_-f15§;
         fb_savePhoto = false;
         fb_copyFields = ["name","sex"];
         fb_saveFields = ["profile","bdate","photo_big","country"];
         fb_groupAddress = §_-a9§.§_-sc§ ? "https://www.facebook.com/squirrelstragedy/" : "https://www.facebook.com/belkigame";
         fb_appAddress = §_-a9§.§_-sc§ ? "https://apps.facebook.com/squirrelstragedy/" : "https://apps.facebook.com/tragedyofsquirrels/";
         fb_groupId = §_-a9§.§_-sc§ ? "302416696482094" : "137323319735776";
         fb_bankDialog = §_-X2r§;
         fb_inviteFriendMessage = gls("Увлекательная игра Трагедия Белок, присоединяйся!");
         fb_appId = §_-a9§.§_-gC§;
         fb_requestFields = "id,first_name,last_name,gender,birthday,locale,picture,link,location";
         fb_buy_url = §_-a9§.§_-B3c§;
         fb_crossAppId = !§_-a9§.§_-sc§ ? "106813929457679" : "";
         fs_type = §_-a9§.§_-kT§;
         fs_savePhoto = false;
         fs_copyFields = ["name","sex"];
         fs_saveFields = ["profile","bdate","photo_big"];
         fs_groupAddress = "https://fotostrana.ru/community/43306/";
         fs_bankDialog = §_-Cq§;
         fs_requestFields = "user_name,sex,birthday,photo_big,user_link";
         fs_photoUrl = "photo_small";
         fs_appId = §_-a9§.§_-7y§;
         fs_secret = §_-a9§.§_-u1Y§;
         mm_type = §_-a9§.§_-C3f§;
         mm_savePhoto = false;
         mm_copyFields = ["name","sex"];
         mm_saveFields = ["profile","bdate","photo_big","country"];
         mm_groupAddress = "https://my.mail.ru/community/squirrels_game/";
         mm_groupId = "8847861727607833664";
         mm_bankDialog = §_-S0§;
         mm_appAddress = "https://my.mail.ru/apps/648036";
         mm_secret = §_-a9§.§_-q2p§;
         mm_photoUrl = "pic_small";
         mm_inviteFriendMessage = "Увлекательная игра Трагедия Белок, присоединяйся!";
         ok_type = §_-a9§.§_-y1q§;
         ok_savePhoto = false;
         ok_copyFields = ["name","sex"];
         ok_saveFields = ["profile","bdate","photo_big","country"];
         ok_groupAddress = "https://www.odnoklassniki.ru/group/51869321068777";
         ok_groupId = "52192660979156";
         ok_bankDialog = §_-Pq§;
         ok_appAddress = "https://www.odnoklassniki.ru/game/squirrels";
         ok_requestFields = "uid,first_name,name,gender,birthday,location,pic_2,url_profile";
         ok_photoUrl = "pic50x50";
         sa_type = §_-a9§.§_-3n§;
         sa_savePhoto = false;
         sa_copyFields = ["name","sex","email"];
         sa_saveFields = ["profile","bdate","photo_big"];
         sa_bankDialog = §_-rb§;
         sa_appId = §_-a9§.§_-Nc§;
         sa_apiUrl = §_-a9§.§_-d1l§;
         payment_currency = §_-a9§.§_-sc§ ? "RUB" : "USD";
         xsolla_get_token_url = §_-a9§.§_-R1L§;
         yookassa_get_token_url = §_-a9§.§_-y1G§;
         yookassa_payement_url = §_-a9§.§_-w1x§;
         robokassa_get_token_url = §_-a9§.§_-a2p§;
         robokassa_payement_url = §_-a9§.§_-QI§;
         uploadHandler = function(param1:Player):Boolean
         {
            if(param1.photoBig.indexOf("/saved/") != -1)
            {
               return true;
            }
            var _loc2_:ByteArray = new ByteArray();
            _loc2_.writeUTFBytes(param1.self["photo_big"]);
            var _loc3_:String = §_-a9§.§_-73§ + param1.id % §_-a9§.§_-e2s§ + "/" + param1.id + "/" + CRC32.hash(_loc2_) + ".png";
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

