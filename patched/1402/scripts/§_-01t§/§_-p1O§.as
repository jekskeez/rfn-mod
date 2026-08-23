package §_-01t§
{
   import §_-22D§.TweenMax;
   import §_-B1G§.§_-Pd§;
   import §_-Qy§.§_-x2d§;
   import §_-S1n§.§_-kr§;
   import §_-X1k§.§_-73B§;
   import §_-X1k§.§_-C3E§;
   import §_-X1k§.§_-VZ§;
   import §_-X1k§.§_-Wd§;
   import §_-X1k§.§_-ku§;
   import §_-bN§.§_-Sg§;
   import buttons.§_-K2G§;
   import events.GameEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class §_-p1O§ extends Sprite
   {
      
      private static const §_-o1y§:int = 403;
      
      public static const §_-m2n§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,16,16777215);
      
      public static const §_-Zz§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,13,16777215,null,null,null,null,null,"center");
      
      public static const §_-Vn§:TextFormat = new TextFormat(null,14,16730663,true);
      
      public static const §_-9H§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,24,16777215);
      
      public static const §_-31I§:TextFormat = new TextFormat(null,18,6504987,true);
      
      public static const §_-C1Q§:TextFormat = new TextFormat(null,12,6763521,true);
      
      private static var §_-B2B§:Number = 3000;
      
      private static var _instance:§_-p1O§ = null;
      
      private static var §_-d2j§:int = 17;
      
      private var buy:Function = null;
      
      private var §_-Y1T§:§_-i5§ = null;
      
      private var §_-r1Y§:§_-i5§ = null;
      
      private var §_-cz§:§_-i5§ = null;
      
      private var §_-pU§:§_-x2d§ = null;
      
      private var §_-B1u§:Sprite = null;
      
      private var §_-p1S§:Sprite = null;
      
      private var §_-q2A§:DisplayObject = null;
      
      private var §_-s1J§:Sprite = null;
      
      private var §_-F3§:Sprite = null;
      
      private var §_-l1k§:Array = [];
      
      private var §_-o8§:TweenMax = null;
      
      private var §_-z2y§:TweenMax = null;
      
      private var §_-e1h§:TweenMax = null;
      
      private var buttonBuy:§_-K2G§ = null;
      
      private var §_-8e§:int = -1;
      
      private var index:int = 0;
      
      private var §_-O2X§:§_-VZ§ = null;
      
      private var §_-L2R§:§_-Pd§;
      
      private var §_-1F§:DisplayObject = null;
      
      public function §_-p1O§(param1:Function)
      {
         super();
         _instance = this;
         this.buy = param1;
         §_-d2j§ = §_-C3E§.ids != null && §_-C3E§.ids.length > 0 ? int(§_-C3E§.ids[0]) : 1;
         this.init();
         §_-C3E§.addEventListener(GameEvent.BUNDLE_UPDATE,this.§_-Ts§);
         §_-V1C§(§_-C3E§.ids[1]);
         this.§_-L2R§.§_-l1Y§(§_-C3E§.ids[1]);
      }
      
      public static function §_-V1C§(param1:int) : void
      {
         if(_instance)
         {
            _instance.§_-n1s§ = param1;
            _instance.index = §_-C3E§.ids.indexOf(_instance.§_-n1s§);
         }
         else
         {
            §_-d2j§ = param1;
         }
      }
      
      public static function §_-R2x§(param1:Class) : String
      {
         switch(param1)
         {
            case ImageGetBalloon:
               return gls("С помощью шариков можно попадать в недоступные для других места и сокращать путь до дупла или ореха! Рождённый лазать сможеть летать!");
            case ImageGetCoins:
               return gls("Монеты нужны в игре, чтобы стать сильнее, быстрее и иметь доступ к недоступным за орехи покупкам. Толще карман - больше возможностей!");
            case ImageGetCollections:
               return gls("Из элементов коллекции собираются наборы - за это даётся опыт. А за наборы коллекций можно получить уникальных персонажей - Скрэта и Скрэтти.");
            case ImageGetCollectionsRare:
               return gls("Редкие элементы коллекции не часто можно встретить на локации. Каждый из них поможет тебе собрать набор или несколько!");
            case ImageGetEnergy:
               return gls("Энергия используется для доступа на локации. Чем больше у тебя энергии, тем дольше сможешь играть без перерыва!");
            case ImageGetExp:
               return gls("Опыт позволяет получать новые уровни и открывать доступ к новым локациям и захватывающим режимам!");
            case ImageGetItemsPack:
               return gls("Набор предметов шамана всех типов сделает из тебя перспективного помощника шамана или грозу других белок... Решать тебе!");
            case ImageGetMana:
               return gls("Мана позволяет тебе творить заклинания и использовать способности костюмов. С такой магией любые преграды будут по плечу!");
            case ImageGetManaRegenDrink:
               return gls("Зелье могущества делает невозможное - позволяет мане восстанавливаться со временем! Это же неограниченные возможности в колдовстве!");
            case ImageGetPackage:
               return gls("Костюмы, наделяющие способностями и уникальной магией.. Ты получишь один из костюмов, который сейчас доступен в магазине.");
            case ImageGetPackageRare:
               return gls("Редкий костюм - это невероятная привелегия! Это один из костюмов, который был когда-то в игре, но сейчас уже недоступен для приобретения.");
            case ImageGetPackageVampire:
               return gls("Стильный и красочный костюм Вампира! Позволяет призвать стаю летучих мышей, которые принесут предмет коллекции на раунде своему хозяину.");
            case ImageGetPackageVendigo:
               return gls("Костюм Вендиго позволяет превратиться в быстрого Оборотня и забрать элемент коллекции у случайной белки.");
            case ImageGetPackageWizard:
               return gls("Уникальные костюмы Волшебника и Волшебницы, которые позволяют копировать заклинания других белок! Ты практически непобедим и всегда на шаг впереди других колдунов!");
            case ImageGetPackageWolf:
               return gls("Невероятно редкий костюм Снежного Волка. Позволяет вызывать снежную бурю, которая замедляет других белок, и замораживать элементы коллекций.");
            case ImageGetPowers:
               return gls("Энергия и мана в одном флаконе! Играй дольше и колдуй чаще. Получаемые энергия и мана пополняются сверх максимума.");
            case ImageGetVip:
               return gls("VIP-статус увеличивает максимум энергии, восстанавливает ману ежедневно, даёт одно воскрешение, удваивает получаемый на локации опыт и многое другое.");
            default:
               return "";
         }
      }
      
      private function init() : void
      {
         var _loc1_:ImageBundleBack = new ImageBundleBack();
         _loc1_.scaleY = 1.15;
         _loc1_.width += 5;
         addChild(_loc1_);
         this.§_-pU§ = new §_-x2d§();
         addChild(this.§_-pU§);
         this.§_-Y1T§ = new §_-i5§("",0,9,§_-m2n§);
         addChild(this.§_-Y1T§);
         this.§_-r1Y§ = new §_-i5§("",0,270,§_-31I§);
         addChild(this.§_-r1Y§);
         this.§_-F3§ = new Sprite();
         this.§_-F3§.addChild(new BundleExpiredBack());
         this.§_-F3§.x = §_-o1y§ - this.§_-F3§.width - 3;
         this.§_-F3§.y = 45;
         addChild(this.§_-F3§);
         var _loc2_:§_-i5§ = new §_-i5§(gls("Исчезнет\nчерез"),0,5,§_-Zz§);
         _loc2_.x = int((this.§_-F3§.width - _loc2_.textWidth) * 0.5) - 3;
         this.§_-F3§.addChild(_loc2_);
         this.§_-cz§ = new §_-i5§("",0,45,§_-Vn§);
         this.§_-F3§.addChild(this.§_-cz§);
         this.buttonBuy = new §_-K2G§(gls("Купить"),85);
         this.buttonBuy.x = 212;
         this.buttonBuy.y = 270;
         this.buttonBuy.addEventListener(MouseEvent.CLICK,this.§_-oC§);
         addChild(this.buttonBuy);
         this.§_-s1J§ = new Sprite();
         this.§_-s1J§.alpha = 0;
         addChild(this.§_-s1J§);
         this.§_-p1S§ = new Sprite();
         this.§_-B1u§ = new Sprite();
         this.§_-B1u§.graphics.beginFill(16777215,0);
         this.§_-B1u§.graphics.drawRect(35,45,333,210);
         this.§_-B1u§.buttonMode = true;
         this.§_-B1u§.addEventListener(MouseEvent.ROLL_OVER,this.§_-T2H§);
         this.§_-B1u§.addEventListener(MouseEvent.ROLL_OUT,this.§_-k2s§);
         addChild(this.§_-B1u§);
         var _loc3_:DisplayObject = new ImageBundleInfo();
         _loc3_.x = int((§_-o1y§ - _loc3_.width) * 0.5);
         _loc3_.y = 246;
         this.§_-p1S§.addChild(_loc3_);
         _loc2_ = new §_-i5§(gls("Заглянуть внутрь"),0,241,new TextFormat(null,14,2926523,true));
         _loc2_.x = _loc3_.x + 15 + int((_loc3_.width - _loc2_.textWidth - 15) * 0.5);
         this.§_-p1S§.addChild(_loc2_);
         this.§_-B1u§.addChild(this.§_-p1S§);
         this.§_-L2R§ = new §_-Pd§(§_-C3E§.ids.length);
         this.§_-L2R§.§_-E2B§(this.§_-X2c§);
         this.§_-L2R§.x = int((_loc1_.width - this.§_-L2R§.width) * 0.5);
         this.§_-L2R§.y = this.height - this.§_-L2R§.height - 20;
         addChild(this.§_-L2R§);
         this.§_-Ts§();
         var _loc4_:Sprite = new Sprite();
         _loc4_.graphics.beginFill(255,1);
         _loc4_.graphics.drawRect(0,0,_loc1_.width,this.height);
         _loc4_.graphics.endFill();
         this.mask = _loc4_;
         this.addChild(_loc4_);
      }
      
      override public function set visible(param1:Boolean) : void
      {
         super.visible = param1;
         if(param1)
         {
            this.§_-L2R§.§_-s27§(§_-B2B§,§_-Pd§.§_-K4§);
         }
         else
         {
            this.§_-L2R§.§_-R1T§();
         }
      }
      
      private function §_-Ts§(param1:GameEvent = null) : void
      {
         if(§_-d2j§ == -1)
         {
            if(this.§_-n1s§ != -1 && §_-C3E§.ids.indexOf(this.§_-n1s§) != -1)
            {
               this.index = §_-C3E§.ids.indexOf(this.§_-n1s§);
            }
            this.§_-n1s§ = §_-C3E§.ids[Math.min(this.index,§_-C3E§.ids.length - 1)];
         }
         else
         {
            this.§_-n1s§ = §_-d2j§;
         }
         this.index = §_-C3E§.ids.indexOf(this.§_-n1s§);
         §_-d2j§ = -1;
      }
      
      private function §_-oC§(param1:MouseEvent) : void
      {
         if(§_-Wd§.§_-xR§)
         {
            return;
         }
         this.buy(this.§_-n1s§);
      }
      
      private function §_-X2c§(param1:int, param2:int) : void
      {
         this.§_-OE§();
         this.§_-1F§ = §_-C3E§.§_-L2Q§(§_-C3E§.ids[param1]).image;
         this.§_-1F§.y = int((296 - this.§_-1F§.height) * 0.5);
         this.§_-B1u§.addChild(this.§_-1F§);
         var _loc3_:int = param2 == §_-Pd§.§_-K4§ ? -200 : 500;
         var _loc4_:int = param2 == §_-Pd§.§_-K4§ ? 500 : -200;
         this.§_-1F§.x = _loc4_;
         this.index = param1;
         TweenMax.to(this.§_-q2A§,0.2,{
            "x":_loc3_,
            "onComplete":this.§_-OE§
         });
         TweenMax.to(this.§_-1F§,0.2,{"x":int((§_-o1y§ - this.§_-1F§.width) * 0.5)});
      }
      
      private function §_-OE§() : void
      {
         if(Boolean(this.§_-1F§) && this.§_-B1u§.contains(this.§_-1F§))
         {
            this.§_-B1u§.removeChild(this.§_-1F§);
         }
         this.§_-1F§ = null;
         this.§_-n1s§ = §_-C3E§.ids[this.index];
      }
      
      private function §_-k2s§(param1:MouseEvent) : void
      {
         this.§_-L2R§.§_-s27§(§_-B2B§,§_-Pd§.§_-K4§);
         if(!this.§_-O2X§.§_-71h§)
         {
            return;
         }
         if(this.§_-o8§)
         {
            this.§_-o8§.§_-kl§();
         }
         this.§_-o8§ = TweenMax.to(this.§_-B1u§,0.1,{"alpha":1});
         this.§_-e1h§ = TweenMax.to(this.§_-F3§,0.1,{"alpha":1});
         if(this.§_-z2y§)
         {
            this.§_-z2y§.§_-kl§();
         }
         this.§_-z2y§ = TweenMax.to(this.§_-s1J§,0.1,{"alpha":0});
      }
      
      private function §_-T2H§(param1:MouseEvent) : void
      {
         this.§_-L2R§.§_-R1T§();
         if(!this.§_-O2X§.§_-71h§)
         {
            return;
         }
         if(this.§_-o8§)
         {
            this.§_-o8§.§_-kl§();
         }
         this.§_-o8§ = TweenMax.to(this.§_-B1u§,0.1,{"alpha":0});
         if(this.§_-e1h§)
         {
            this.§_-e1h§.§_-kl§();
         }
         this.§_-e1h§ = TweenMax.to(this.§_-F3§,0.1,{"alpha":0});
         if(this.§_-z2y§)
         {
            this.§_-z2y§.§_-kl§();
         }
         this.§_-z2y§ = TweenMax.to(this.§_-s1J§,0.1,{"alpha":1});
      }
      
      private function get §_-n1s§() : int
      {
         return this.§_-8e§;
      }
      
      private function set §_-n1s§(param1:int) : void
      {
         if(this.§_-8e§ == param1)
         {
            return;
         }
         this.§_-8e§ = param1 > 0 ? param1 : 0;
         this.§_-O2X§ = §_-C3E§.§_-L2Q§(param1);
         if(this.visible)
         {
            §_-C3E§.§_-O1s§(this.§_-n1s§);
         }
         this.update();
      }
      
      private function update() : void
      {
         if(Boolean(this.§_-q2A§) && this.§_-B1u§.contains(this.§_-q2A§))
         {
            this.§_-B1u§.removeChild(this.§_-q2A§);
         }
         this.§_-q2A§ = this.§_-O2X§.image;
         this.§_-q2A§.x = int((§_-o1y§ + 7 - this.§_-q2A§.width) * 0.5);
         this.§_-q2A§.y = int((296 - this.§_-q2A§.height) * 0.5);
         this.§_-B1u§.addChild(this.§_-q2A§);
         var _loc1_:Boolean = this.§_-n1s§ == §_-C3E§.§_-l1w§ || this.§_-n1s§ == §_-C3E§.§_-ev§;
         this.§_-F3§.visible = _loc1_;
         if(_loc1_)
         {
            §_-ku§.addEventListener(GameEvent.ON_CHANGE,this.§_-w1T§);
            this.§_-w1T§(null);
         }
         else
         {
            §_-ku§.removeEventListener(GameEvent.ON_CHANGE,this.§_-w1T§);
         }
         if(this.§_-O2X§.§_-71h§)
         {
            this.§_-p1S§.visible = true;
            this.§_-727§();
         }
         else
         {
            this.§_-p1S§.visible = false;
         }
         this.§_-Y1T§.text = this.§_-O2X§.name;
         this.§_-Y1T§.x = int((§_-o1y§ - this.§_-Y1T§.textWidth) * 0.5);
         this.§_-pU§.§_-52M§ = this.§_-O2X§.§_-52M§;
         var _loc2_:§_-VZ§ = §_-C3E§.§_-L2Q§(this.§_-n1s§);
         this.§_-r1Y§.text = §_-Sg§.instance.getPriceString(_loc2_.price);
         this.§_-r1Y§.x = int((§_-o1y§ - this.§_-r1Y§.textWidth - this.buttonBuy.width - 10) * 0.5);
         this.buttonBuy.x = this.§_-r1Y§.x + this.§_-r1Y§.textWidth + 10;
      }
      
      private function §_-727§() : void
      {
         var _loc3_:Sprite = null;
         var _loc4_:DisplayObject = null;
         var _loc5_:Sprite = null;
         var _loc6_:§_-i5§ = null;
         while(this.§_-s1J§.numChildren > 0)
         {
            this.§_-s1J§.removeChildAt(0);
         }
         while(this.§_-l1k§.length > 0)
         {
            this.§_-B1u§.removeChild(this.§_-l1k§.shift());
         }
         var _loc1_:Vector.<§_-73B§> = this.§_-O2X§.§_-71h§;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc3_ = new Sprite();
            _loc3_.x = _loc2_ % 2 * 180;
            _loc3_.y = int(_loc2_ * 0.5) * 50;
            this.§_-s1J§.addChild(_loc3_);
            _loc4_ = new _loc1_[_loc2_].imageClass();
            _loc3_.addChild(_loc4_);
            _loc5_ = new Sprite();
            _loc5_.x = _loc3_.x;
            _loc5_.y = _loc3_.y;
            _loc5_.graphics.beginFill(16777215,0);
            _loc5_.graphics.drawRect(0,0,50,50);
            this.§_-B1u§.addChild(_loc5_);
            this.§_-l1k§.push(_loc5_);
            new §_-kr§(_loc5_,§_-R2x§(_loc1_[_loc2_].imageClass));
            _loc6_ = new §_-i5§(_loc1_[_loc2_].description,_loc4_.width + 5,0,§_-C1Q§);
            _loc6_.wordWrap = true;
            _loc6_.width = 145;
            _loc6_.y = (_loc4_.height - _loc6_.textHeight) * 0.5 - 2;
            _loc3_.addChild(_loc6_);
            _loc2_++;
         }
         if(_loc1_.length > 1 && _loc1_.length % 2 == 1)
         {
            _loc3_.x += 90;
            _loc5_.x += 90;
         }
         this.§_-s1J§.graphics.clear();
         this.§_-s1J§.graphics.beginFill(0,0);
         this.§_-s1J§.graphics.drawRect(0,0,_loc1_.length > 1 ? 345 : 180,(1 + int((_loc1_.length - 1) * 0.5)) * 60 - 10);
         this.§_-s1J§.x = int((430 - this.§_-s1J§.width) * 0.5);
         this.§_-s1J§.y = int((376 - this.§_-s1J§.height) * 0.5);
         _loc2_ = 0;
         while(_loc2_ < this.§_-l1k§.length)
         {
            this.§_-l1k§[_loc2_].x += this.§_-s1J§.x - this.§_-B1u§.x;
            this.§_-l1k§[_loc2_].y += this.§_-s1J§.y - this.§_-B1u§.y;
            _loc2_++;
         }
      }
      
      private function §_-w1T§(param1:GameEvent) : void
      {
         var _loc2_:int = -1;
         switch(this.§_-n1s§)
         {
            case §_-C3E§.§_-ev§:
               _loc2_ = §_-ku§.§_-63n§;
               break;
            case §_-C3E§.§_-l1w§:
               _loc2_ = §_-ku§.§_-B1L§;
               break;
            default:
               return;
         }
         this.§_-cz§.text = §_-ku§.§_-g2V§(_loc2_);
         this.§_-cz§.x = int((72 - this.§_-cz§.textWidth) * 0.5);
      }
   }
}

