package views
{
   import §_-S1n§.§_-kr§;
   import §_-X1k§.§_-Wd§;
   import §_-X1k§.§_-hO§;
   import §_-X1k§.§_-r12§;
   import §_-bN§.§_-TB§;
   import §_-c2C§.§_-u24§;
   import §_-s2e§.§_-U2d§;
   import buttons.§_-K2G§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-n2E§;
   import protocol.§_-u1O§;
   import utils.§_-8p§;
   import utils.§_-K1Y§;
   
   public class §_-53z§ extends Sprite
   {
      
      public static const §_-81Q§:Array = [{
         "replaceString":"#Ac",
         "imageClass":ImageIconNut,
         "scaleX":0.92,
         "scaleY":0.92,
         "shiftX":5,
         "shiftY":3
      },{
         "replaceString":"#Ex",
         "imageClass":ImageIconExp,
         "scaleX":1,
         "scaleY":1,
         "shiftX":7,
         "shiftY":3
      },{
         "replaceString":"#Mn",
         "imageClass":ImageIconMana,
         "scaleX":1,
         "scaleY":1,
         "shiftX":4,
         "shiftY":2
      },{
         "replaceString":"#Co",
         "imageClass":ImageIconCoins,
         "scaleX":1,
         "scaleY":1,
         "shiftX":4,
         "shiftY":2
      }];
      
      private static const §_-W2P§:TextFormat = new TextFormat(null,13,9337447,true);
      
      private static const §_-C1Q§:TextFormat = new TextFormat(null,12,16777215,true);
      
      private static const §_-1M§:TextFormat = new TextFormat(null,16,7232071,true);
      
      private static const §_-Ji§:TextFormat = new TextFormat(null,13,16777215,true);
      
      private static const §_-S2b§:GlowFilter = new GlowFilter(14796963,1,6,6,8);
      
      private static const §_-43s§:GlowFilter = new GlowFilter(0,1,2,2,1);
      
      private static const §_-F2n§:Array = [50,100];
      
      private var §_-Uy§:§_-u1x§;
      
      private var callback:Function;
      
      private var §_-W2d§:§_-i5§;
      
      private var §_-I1z§:§_-i5§;
      
      private var §_-11b§:§_-8p§;
      
      private var buttonBuy:§_-K2G§;
      
      private var §_-R1i§:§_-K2G§;
      
      private var §_-L1s§:§_-K2G§;
      
      private var §_-J2e§:§_-K2G§;
      
      public function §_-53z§(param1:§_-u1x§, param2:Function)
      {
         super();
         this.§_-Uy§ = param1;
         this.callback = param2;
         this.init();
      }
      
      public function §_-L23§() : void
      {
         this.§_-W2d§.text = gls("Миссия сменится через: {0}",this.§_-Uy§.§_-JX§);
      }
      
      public function update() : void
      {
         this.§_-I1z§.text = this.§_-Uy§.short + " " + this.§_-Uy§.value + "/" + this.§_-Uy§.§_-Ht§;
         this.§_-I1z§.x = 115 - int(this.§_-I1z§.textWidth * 0.5);
         this.§_-11b§.§_-d1Z§(this.§_-Uy§.value,this.§_-Uy§.§_-Ht§);
         this.§_-J2e§.visible = !this.§_-Uy§.§_-HU§;
         this.§_-L1s§.visible = this.§_-Uy§.§_-HU§;
         this.buttonBuy.enabled = !this.§_-Uy§.§_-HU§;
         this.§_-R1i§.enabled = !this.§_-Uy§.§_-HU§;
      }
      
      private function init() : void
      {
         addChild(new DailyQuestBack());
         var _loc1_:DisplayObject = this.§_-Uy§.icon;
         _loc1_.x = 5;
         _loc1_.y = 12;
         addChild(_loc1_);
         addChild(new §_-i5§(this.§_-Uy§.name,40,10,§_-W2P§));
         addChild(this.§_-73y§());
         var _loc2_:§_-i5§ = new §_-i5§(gls("Награда"),0,3,§_-Ji§);
         _loc2_.x = 295 + int((168 - _loc2_.textWidth) * 0.5);
         _loc2_.filters = [§_-S2b§];
         addChild(_loc2_);
         this.§_-J2e§ = new §_-K2G§(gls("Подробно"),95);
         this.§_-J2e§.x = 479;
         this.§_-J2e§.y = 15;
         this.§_-J2e§.addEventListener(MouseEvent.CLICK,this.§_-434§);
         this.§_-J2e§.visible = !this.§_-Uy§.§_-HU§;
         this.§_-J2e§.§_-lT§();
         addChild(this.§_-J2e§);
         this.§_-L1s§ = new §_-K2G§(gls("Завершить"),95);
         this.§_-L1s§.x = 479;
         this.§_-L1s§.y = 15;
         this.§_-L1s§.addEventListener(MouseEvent.CLICK,this.onComplete);
         this.§_-L1s§.visible = this.§_-Uy§.§_-HU§;
         addChild(this.§_-L1s§);
         this.§_-11b§ = new §_-8p§([{
            "image":new BarQuestBack(),
            "X":0,
            "Y":0
         },{
            "image":new BarQuestActive(),
            "X":0,
            "Y":0
         },{
            "image":new BarQuestActive(),
            "X":0,
            "Y":0
         }],230);
         this.§_-11b§.x = 43;
         this.§_-11b§.y = 28;
         addChild(this.§_-11b§);
         this.§_-I1z§ = new §_-i5§("",0,0,§_-C1Q§);
         this.§_-I1z§.filters = [§_-43s§];
         this.§_-11b§.addChild(this.§_-I1z§);
         this.§_-W2d§ = new §_-i5§("",195,65,§_-W2P§);
         addChild(this.§_-W2d§);
         this.§_-R1i§ = new §_-K2G§(gls("Выполнять"));
         this.§_-R1i§.x = 565 - this.§_-R1i§.width;
         this.§_-R1i§.y = 62;
         this.§_-R1i§.addEventListener(MouseEvent.CLICK,this.onStart);
         this.§_-R1i§.visible = !this.§_-Uy§.§_-HU§;
         addChild(this.§_-R1i§);
         this.buttonBuy = new §_-K2G§(gls("Сменить за {0} -  ",§_-F2n§[this.§_-Uy§.§_-w2Z§]));
         this.buttonBuy.x = 15;
         this.buttonBuy.y = 62;
         this.buttonBuy.addEventListener(MouseEvent.CLICK,this.§_-t2C§);
         this.buttonBuy.visible = !this.§_-Uy§.§_-HU§;
         this.buttonBuy.§_-I29§();
         addChild(this.buttonBuy);
         §_-K1Y§.§_-P2W§(this.buttonBuy.field,"-",ImageIconNut,0.7,0.7,-this.buttonBuy.field.x - 2,-3,true);
         this.update();
      }
      
      private function §_-434§(param1:MouseEvent) : void
      {
         this.callback(this.§_-Uy§);
      }
      
      private function onComplete(param1:MouseEvent) : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-y2N§,this.§_-Uy§.§_-w2Z§);
      }
      
      private function §_-t2C§(param1:MouseEvent) : void
      {
         Game.buy(§_-u1O§.§_-as§,0,§_-F2n§[this.§_-Uy§.§_-w2Z§],Game.selfId,this.§_-Uy§.§_-w2Z§);
      }
      
      private function onStart(param1:MouseEvent) : void
      {
         var location:int = 0;
         var quest:int = 0;
         var questDifficulty:int = 0;
         var e:MouseEvent = param1;
         if(§_-Wd§.§_-xR§)
         {
            return;
         }
         if(!§_-hO§.§_-w2n§(this.§_-Uy§.location))
         {
            §_-TB§.show(this.§_-Uy§.location);
            return;
         }
         §_-aW§.instance.close();
         location = this.§_-Uy§.location;
         quest = this.§_-Uy§.type;
         questDifficulty = this.§_-Uy§.§_-w2Z§;
         Analytics.§_-Uy§();
         §_-U2d§.load(function():void
         {
            §_-r12§.set(§_-n2E§.§_-T2s§);
            §_-u24§.start(location);
            §_-kG§.§_-E1U§ = quest;
            §_-kG§.§_-Z2K§ = questDifficulty;
         },true);
      }
      
      private function §_-73y§() : DisplayObject
      {
         var _loc4_:DisplayObject = null;
         var _loc1_:Sprite = new Sprite();
         var _loc2_:§_-i5§ = new §_-i5§(this.§_-Uy§.award,0,0,§_-1M§);
         _loc1_.addChild(_loc2_);
         §_-K1Y§.§_-31q§(_loc2_,§_-81Q§);
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.numChildren)
         {
            _loc4_ = _loc1_.getChildAt(_loc3_);
            if(_loc4_ is ImageIconNut)
            {
               new §_-kr§(_loc4_,gls("Орехи"));
            }
            if(_loc4_ is ImageIconExp)
            {
               new §_-kr§(_loc4_,gls("Опыт"));
            }
            if(_loc4_ is ImageIconMana)
            {
               new §_-kr§(_loc4_,gls("Мана"));
            }
            _loc3_++;
         }
         _loc1_.x = 296.5 + int((168 - _loc1_.width) * 0.5);
         _loc1_.y = 22;
         return _loc1_;
      }
   }
}

