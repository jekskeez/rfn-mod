package §_-Z24§
{
   import §_-42B§.TweenMax;
   import §_-I10§.§_-51T§;
   import §_-I10§.§_-63q§;
   import §_-I10§.§_-S16§;
   import §_-I10§.§_-S9§;
   import §_-I10§.§_-e1z§;
   import §_-Kr§.§_-Q2o§;
   import §_-d10§.§_-RA§;
   import §_-e1G§.§_-Hb§;
   import §_-k1c§.§_-7O§;
   import buttons.§_-j18§;
   import events.GameEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class §_-L1d§ extends Sprite
   {
      
      private static const §_-NB§:int = 403;
      
      public static const §_-h2m§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,16,16777215);
      
      public static const §_-D1t§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,13,16777215,null,null,null,null,null,"center");
      
      public static const §_-u1p§:TextFormat = new TextFormat(null,14,16730663,true);
      
      public static const §_-BO§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,24,16777215);
      
      public static const §_-23q§:TextFormat = new TextFormat(null,18,6504987,true);
      
      public static const §_-CD§:TextFormat = new TextFormat(null,12,6763521,true);
      
      private static var §_-82Z§:Number = 3000;
      
      private static var _instance:§_-L1d§ = null;
      
      private static var §_-S1f§:int = 17;
      
      private var buy:Function = null;
      
      private var §_-zl§:§_-22V§ = null;
      
      private var §_-410§:§_-22V§ = null;
      
      private var §_-Om§:§_-22V§ = null;
      
      private var §_-c2e§:§_-RA§ = null;
      
      private var §_-f1e§:Sprite = null;
      
      private var §_-Y11§:Sprite = null;
      
      private var §_-iS§:DisplayObject = null;
      
      private var §_-63n§:Sprite = null;
      
      private var §_-oA§:Sprite = null;
      
      private var §_-C1i§:Array = [];
      
      private var §_-U1e§:TweenMax = null;
      
      private var §_-b2F§:TweenMax = null;
      
      private var §_-U1Z§:TweenMax = null;
      
      private var buttonBuy:§_-j18§ = null;
      
      private var §_-y2o§:int = -1;
      
      private var index:int = 0;
      
      private var §_-bL§:§_-63q§ = null;
      
      private var §_-n24§:§_-Q2o§;
      
      private var §_-020§:DisplayObject = null;
      
      public function §_-L1d§(param1:Function)
      {
         super();
         _instance = this;
         this.buy = param1;
         §_-S1f§ = §_-S9§.ids != null && §_-S9§.ids.length > 0 ? int(§_-S9§.ids[0]) : 1;
         this.init();
         §_-S9§.addEventListener(GameEvent.BUNDLE_UPDATE,this.§_-21l§);
         §_-6U§(§_-S9§.ids[1]);
         this.§_-n24§.§_-32c§(§_-S9§.ids[1]);
      }
      
      public static function §_-6U§(param1:int) : void
      {
         if(_instance)
         {
            _instance.§_-y1l§ = param1;
            _instance.index = §_-S9§.ids.indexOf(_instance.§_-y1l§);
         }
         else
         {
            §_-S1f§ = param1;
         }
      }
      
      public static function §_-Z15§(param1:Class) : String
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
         this.§_-c2e§ = new §_-RA§();
         addChild(this.§_-c2e§);
         this.§_-zl§ = new §_-22V§("",0,9,§_-h2m§);
         addChild(this.§_-zl§);
         this.§_-410§ = new §_-22V§("",0,270,§_-23q§);
         addChild(this.§_-410§);
         this.§_-oA§ = new Sprite();
         this.§_-oA§.addChild(new BundleExpiredBack());
         this.§_-oA§.x = §_-NB§ - this.§_-oA§.width - 3;
         this.§_-oA§.y = 45;
         addChild(this.§_-oA§);
         var _loc2_:§_-22V§ = new §_-22V§(gls("Исчезнет\nчерез"),0,5,§_-D1t§);
         _loc2_.x = int((this.§_-oA§.width - _loc2_.textWidth) * 0.5) - 3;
         this.§_-oA§.addChild(_loc2_);
         this.§_-Om§ = new §_-22V§("",0,45,§_-u1p§);
         this.§_-oA§.addChild(this.§_-Om§);
         this.buttonBuy = new §_-j18§(gls("Купить"),85);
         this.buttonBuy.x = 212;
         this.buttonBuy.y = 270;
         this.buttonBuy.addEventListener(MouseEvent.CLICK,this.§_-p28§);
         addChild(this.buttonBuy);
         this.§_-63n§ = new Sprite();
         this.§_-63n§.alpha = 0;
         addChild(this.§_-63n§);
         this.§_-Y11§ = new Sprite();
         this.§_-f1e§ = new Sprite();
         this.§_-f1e§.graphics.beginFill(16777215,0);
         this.§_-f1e§.graphics.drawRect(35,45,333,210);
         this.§_-f1e§.buttonMode = true;
         this.§_-f1e§.addEventListener(MouseEvent.ROLL_OVER,this.§_-Q20§);
         this.§_-f1e§.addEventListener(MouseEvent.ROLL_OUT,this.§_-9c§);
         addChild(this.§_-f1e§);
         var _loc3_:DisplayObject = new ImageBundleInfo();
         _loc3_.x = int((§_-NB§ - _loc3_.width) * 0.5);
         _loc3_.y = 246;
         this.§_-Y11§.addChild(_loc3_);
         _loc2_ = new §_-22V§(gls("Заглянуть внутрь"),0,241,new TextFormat(null,14,2926523,true));
         _loc2_.x = _loc3_.x + 15 + int((_loc3_.width - _loc2_.textWidth - 15) * 0.5);
         this.§_-Y11§.addChild(_loc2_);
         this.§_-f1e§.addChild(this.§_-Y11§);
         this.§_-n24§ = new §_-Q2o§(§_-S9§.ids.length);
         this.§_-n24§.§_-G0§(this.§_-yb§);
         this.§_-n24§.x = int((_loc1_.width - this.§_-n24§.width) * 0.5);
         this.§_-n24§.y = this.height - this.§_-n24§.height - 20;
         addChild(this.§_-n24§);
         this.§_-21l§();
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
            this.§_-n24§.§_-7I§(§_-82Z§,§_-Q2o§.§_-82U§);
         }
         else
         {
            this.§_-n24§.§_-HE§();
         }
      }
      
      private function §_-21l§(param1:GameEvent = null) : void
      {
         if(§_-S1f§ == -1)
         {
            if(this.§_-y1l§ != -1 && §_-S9§.ids.indexOf(this.§_-y1l§) != -1)
            {
               this.index = §_-S9§.ids.indexOf(this.§_-y1l§);
            }
            this.§_-y1l§ = §_-S9§.ids[Math.min(this.index,§_-S9§.ids.length - 1)];
         }
         else
         {
            this.§_-y1l§ = §_-S1f§;
         }
         this.index = §_-S9§.ids.indexOf(this.§_-y1l§);
         §_-S1f§ = -1;
      }
      
      private function §_-p28§(param1:MouseEvent) : void
      {
         if(§_-S16§.§_-j1Q§)
         {
            return;
         }
         this.buy(this.§_-y1l§);
      }
      
      private function §_-yb§(param1:int, param2:int) : void
      {
         this.§_-03d§();
         this.§_-020§ = §_-S9§.§_-b28§(§_-S9§.ids[param1]).image;
         this.§_-020§.y = int((296 - this.§_-020§.height) * 0.5);
         this.§_-f1e§.addChild(this.§_-020§);
         var _loc3_:int = param2 == §_-Q2o§.§_-82U§ ? -200 : 500;
         var _loc4_:int = param2 == §_-Q2o§.§_-82U§ ? 500 : -200;
         this.§_-020§.x = _loc4_;
         this.index = param1;
         TweenMax.to(this.§_-iS§,0.2,{
            "x":_loc3_,
            "onComplete":this.§_-03d§
         });
         TweenMax.to(this.§_-020§,0.2,{"x":int((§_-NB§ - this.§_-020§.width) * 0.5)});
      }
      
      private function §_-03d§() : void
      {
         if(Boolean(this.§_-020§) && this.§_-f1e§.contains(this.§_-020§))
         {
            this.§_-f1e§.removeChild(this.§_-020§);
         }
         this.§_-020§ = null;
         this.§_-y1l§ = §_-S9§.ids[this.index];
      }
      
      private function §_-9c§(param1:MouseEvent) : void
      {
         this.§_-n24§.§_-7I§(§_-82Z§,§_-Q2o§.§_-82U§);
         if(!this.§_-bL§.§_-T2F§)
         {
            return;
         }
         if(this.§_-U1e§)
         {
            this.§_-U1e§.§_-h2r§();
         }
         this.§_-U1e§ = TweenMax.to(this.§_-f1e§,0.1,{"alpha":1});
         this.§_-U1Z§ = TweenMax.to(this.§_-oA§,0.1,{"alpha":1});
         if(this.§_-b2F§)
         {
            this.§_-b2F§.§_-h2r§();
         }
         this.§_-b2F§ = TweenMax.to(this.§_-63n§,0.1,{"alpha":0});
      }
      
      private function §_-Q20§(param1:MouseEvent) : void
      {
         this.§_-n24§.§_-HE§();
         if(!this.§_-bL§.§_-T2F§)
         {
            return;
         }
         if(this.§_-U1e§)
         {
            this.§_-U1e§.§_-h2r§();
         }
         this.§_-U1e§ = TweenMax.to(this.§_-f1e§,0.1,{"alpha":0});
         if(this.§_-U1Z§)
         {
            this.§_-U1Z§.§_-h2r§();
         }
         this.§_-U1Z§ = TweenMax.to(this.§_-oA§,0.1,{"alpha":0});
         if(this.§_-b2F§)
         {
            this.§_-b2F§.§_-h2r§();
         }
         this.§_-b2F§ = TweenMax.to(this.§_-63n§,0.1,{"alpha":1});
      }
      
      private function get §_-y1l§() : int
      {
         return this.§_-y2o§;
      }
      
      private function set §_-y1l§(param1:int) : void
      {
         if(this.§_-y2o§ == param1)
         {
            return;
         }
         this.§_-y2o§ = param1 > 0 ? param1 : 0;
         this.§_-bL§ = §_-S9§.§_-b28§(param1);
         if(this.visible)
         {
            §_-S9§.§_-027§(this.§_-y1l§);
         }
         this.update();
      }
      
      private function update() : void
      {
         if(Boolean(this.§_-iS§) && this.§_-f1e§.contains(this.§_-iS§))
         {
            this.§_-f1e§.removeChild(this.§_-iS§);
         }
         this.§_-iS§ = this.§_-bL§.image;
         this.§_-iS§.x = int((§_-NB§ + 7 - this.§_-iS§.width) * 0.5);
         this.§_-iS§.y = int((296 - this.§_-iS§.height) * 0.5);
         this.§_-f1e§.addChild(this.§_-iS§);
         var _loc1_:Boolean = this.§_-y1l§ == §_-S9§.§_-Q2A§ || this.§_-y1l§ == §_-S9§.§_-y1V§;
         this.§_-oA§.visible = _loc1_;
         if(_loc1_)
         {
            §_-e1z§.addEventListener(GameEvent.ON_CHANGE,this.§_-Hp§);
            this.§_-Hp§(null);
         }
         else
         {
            §_-e1z§.removeEventListener(GameEvent.ON_CHANGE,this.§_-Hp§);
         }
         if(this.§_-bL§.§_-T2F§)
         {
            this.§_-Y11§.visible = true;
            this.§_-j19§();
         }
         else
         {
            this.§_-Y11§.visible = false;
         }
         this.§_-zl§.text = this.§_-bL§.name;
         this.§_-zl§.x = int((§_-NB§ - this.§_-zl§.textWidth) * 0.5);
         this.§_-c2e§.§_-t2j§ = this.§_-bL§.§_-t2j§;
         var _loc2_:§_-63q§ = §_-S9§.§_-b28§(this.§_-y1l§);
         this.§_-410§.text = §_-7O§.instance.getPriceString(_loc2_.price);
         this.§_-410§.x = int((§_-NB§ - this.§_-410§.textWidth - this.buttonBuy.width - 10) * 0.5);
         this.buttonBuy.x = this.§_-410§.x + this.§_-410§.textWidth + 10;
      }
      
      private function §_-j19§() : void
      {
         var _loc3_:Sprite = null;
         var _loc4_:DisplayObject = null;
         var _loc5_:Sprite = null;
         var _loc6_:§_-22V§ = null;
         while(this.§_-63n§.numChildren > 0)
         {
            this.§_-63n§.removeChildAt(0);
         }
         while(this.§_-C1i§.length > 0)
         {
            this.§_-f1e§.removeChild(this.§_-C1i§.shift());
         }
         var _loc1_:Vector.<§_-51T§> = this.§_-bL§.§_-T2F§;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc3_ = new Sprite();
            _loc3_.x = _loc2_ % 2 * 180;
            _loc3_.y = int(_loc2_ * 0.5) * 50;
            this.§_-63n§.addChild(_loc3_);
            _loc4_ = new _loc1_[_loc2_].imageClass();
            _loc3_.addChild(_loc4_);
            _loc5_ = new Sprite();
            _loc5_.x = _loc3_.x;
            _loc5_.y = _loc3_.y;
            _loc5_.graphics.beginFill(16777215,0);
            _loc5_.graphics.drawRect(0,0,50,50);
            this.§_-f1e§.addChild(_loc5_);
            this.§_-C1i§.push(_loc5_);
            new §_-Hb§(_loc5_,§_-Z15§(_loc1_[_loc2_].imageClass));
            _loc6_ = new §_-22V§(_loc1_[_loc2_].description,_loc4_.width + 5,0,§_-CD§);
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
         this.§_-63n§.graphics.clear();
         this.§_-63n§.graphics.beginFill(0,0);
         this.§_-63n§.graphics.drawRect(0,0,_loc1_.length > 1 ? 345 : 180,(1 + int((_loc1_.length - 1) * 0.5)) * 60 - 10);
         this.§_-63n§.x = int((430 - this.§_-63n§.width) * 0.5);
         this.§_-63n§.y = int((376 - this.§_-63n§.height) * 0.5);
         _loc2_ = 0;
         while(_loc2_ < this.§_-C1i§.length)
         {
            this.§_-C1i§[_loc2_].x += this.§_-63n§.x - this.§_-f1e§.x;
            this.§_-C1i§[_loc2_].y += this.§_-63n§.y - this.§_-f1e§.y;
            _loc2_++;
         }
      }
      
      private function §_-Hp§(param1:GameEvent) : void
      {
         var _loc2_:int = -1;
         switch(this.§_-y1l§)
         {
            case §_-S9§.§_-y1V§:
               _loc2_ = §_-e1z§.§_-lJ§;
               break;
            case §_-S9§.§_-Q2A§:
               _loc2_ = §_-e1z§.§_-DW§;
               break;
            default:
               return;
         }
         this.§_-Om§.text = §_-e1z§.§_-7v§(_loc2_);
         this.§_-Om§.x = int((72 - this.§_-Om§.textWidth) * 0.5);
      }
   }
}

