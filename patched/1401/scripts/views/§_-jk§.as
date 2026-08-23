package views
{
   import §_-68§.§_-EI§;
   import §_-I10§.§_-Bm§;
   import §_-I10§.§_-S16§;
   import §_-I10§.§_-Z1F§;
   import §_-T2y§.§_-92z§;
   import §_-e1G§.§_-Hb§;
   import §_-k1c§.§_-t1I§;
   import buttons.§_-j18§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-T2o§;
   import protocol.§_-h2B§;
   import utils.§_-jB§;
   import utils.§_-w2v§;
   
   public class §_-jk§ extends Sprite
   {
      
      public static const §_-81v§:Array = [{
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
      
      private static const §_-i2c§:TextFormat = new TextFormat(null,13,9337447,true);
      
      private static const §_-CD§:TextFormat = new TextFormat(null,12,16777215,true);
      
      private static const §_-K1D§:TextFormat = new TextFormat(null,16,7232071,true);
      
      private static const §_-Tu§:TextFormat = new TextFormat(null,13,16777215,true);
      
      private static const §_-Qe§:GlowFilter = new GlowFilter(14796963,1,6,6,8);
      
      private static const §_-E§:GlowFilter = new GlowFilter(0,1,2,2,1);
      
      private static const §_-B30§:Array = [50,100];
      
      private var §_-R2A§:§_-QP§;
      
      private var callback:Function;
      
      private var §_-j2N§:§_-22V§;
      
      private var §_-v1s§:§_-22V§;
      
      private var §_-k1g§:§_-w2v§;
      
      private var buttonBuy:§_-j18§;
      
      private var §_-t1K§:§_-j18§;
      
      private var §_-11d§:§_-j18§;
      
      private var §_-5f§:§_-j18§;
      
      public function §_-jk§(param1:§_-QP§, param2:Function)
      {
         super();
         this.§_-R2A§ = param1;
         this.callback = param2;
         this.init();
      }
      
      public function §_-I9§() : void
      {
         this.§_-j2N§.text = gls("Миссия сменится через: {0}",this.§_-R2A§.§_-i1n§);
      }
      
      public function update() : void
      {
         this.§_-v1s§.text = this.§_-R2A§.short + " " + this.§_-R2A§.value + "/" + this.§_-R2A§.§_-g2T§;
         this.§_-v1s§.x = 115 - int(this.§_-v1s§.textWidth * 0.5);
         this.§_-k1g§.§_-B1n§(this.§_-R2A§.value,this.§_-R2A§.§_-g2T§);
         this.§_-5f§.visible = !this.§_-R2A§.§_-Y2w§;
         this.§_-11d§.visible = this.§_-R2A§.§_-Y2w§;
         this.buttonBuy.enabled = !this.§_-R2A§.§_-Y2w§;
         this.§_-t1K§.enabled = !this.§_-R2A§.§_-Y2w§;
      }
      
      private function init() : void
      {
         addChild(new DailyQuestBack());
         var _loc1_:DisplayObject = this.§_-R2A§.icon;
         _loc1_.x = 5;
         _loc1_.y = 12;
         addChild(_loc1_);
         addChild(new §_-22V§(this.§_-R2A§.name,40,10,§_-i2c§));
         addChild(this.§_-X2A§());
         var _loc2_:§_-22V§ = new §_-22V§(gls("Награда"),0,3,§_-Tu§);
         _loc2_.x = 295 + int((168 - _loc2_.textWidth) * 0.5);
         _loc2_.filters = [§_-Qe§];
         addChild(_loc2_);
         this.§_-5f§ = new §_-j18§(gls("Подробно"),95);
         this.§_-5f§.x = 479;
         this.§_-5f§.y = 15;
         this.§_-5f§.addEventListener(MouseEvent.CLICK,this.§_-R1u§);
         this.§_-5f§.visible = !this.§_-R2A§.§_-Y2w§;
         this.§_-5f§.§_-v5§();
         addChild(this.§_-5f§);
         this.§_-11d§ = new §_-j18§(gls("Завершить"),95);
         this.§_-11d§.x = 479;
         this.§_-11d§.y = 15;
         this.§_-11d§.addEventListener(MouseEvent.CLICK,this.onComplete);
         this.§_-11d§.visible = this.§_-R2A§.§_-Y2w§;
         addChild(this.§_-11d§);
         this.§_-k1g§ = new §_-w2v§([{
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
         this.§_-k1g§.x = 43;
         this.§_-k1g§.y = 28;
         addChild(this.§_-k1g§);
         this.§_-v1s§ = new §_-22V§("",0,0,§_-CD§);
         this.§_-v1s§.filters = [§_-E§];
         this.§_-k1g§.addChild(this.§_-v1s§);
         this.§_-j2N§ = new §_-22V§("",195,65,§_-i2c§);
         addChild(this.§_-j2N§);
         this.§_-t1K§ = new §_-j18§(gls("Выполнять"));
         this.§_-t1K§.x = 565 - this.§_-t1K§.width;
         this.§_-t1K§.y = 62;
         this.§_-t1K§.addEventListener(MouseEvent.CLICK,this.onStart);
         this.§_-t1K§.visible = !this.§_-R2A§.§_-Y2w§;
         addChild(this.§_-t1K§);
         this.buttonBuy = new §_-j18§(gls("Сменить за {0} -  ",§_-B30§[this.§_-R2A§.§_-QN§]));
         this.buttonBuy.x = 15;
         this.buttonBuy.y = 62;
         this.buttonBuy.addEventListener(MouseEvent.CLICK,this.§_-u1Z§);
         this.buttonBuy.visible = !this.§_-R2A§.§_-Y2w§;
         this.buttonBuy.§_-52e§();
         addChild(this.buttonBuy);
         §_-jB§.§_-fG§(this.buttonBuy.field,"-",ImageIconNut,0.7,0.7,-this.buttonBuy.field.x - 2,-3,true);
         this.update();
      }
      
      private function §_-R1u§(param1:MouseEvent) : void
      {
         this.callback(this.§_-R2A§);
      }
      
      private function onComplete(param1:MouseEvent) : void
      {
         Connection.§_-Li§(§_-h2B§.§_-P1K§,this.§_-R2A§.§_-QN§);
      }
      
      private function §_-u1Z§(param1:MouseEvent) : void
      {
         Game.buy(§_-h2B§.§_-q1q§,0,§_-B30§[this.§_-R2A§.§_-QN§],Game.selfId,this.§_-R2A§.§_-QN§);
      }
      
      private function onStart(param1:MouseEvent) : void
      {
         var location:int = 0;
         var quest:int = 0;
         var questDifficulty:int = 0;
         var e:MouseEvent = param1;
         if(§_-S16§.§_-j1Q§)
         {
            return;
         }
         if(!§_-Z1F§.§_-92p§(this.§_-R2A§.location))
         {
            §_-t1I§.show(this.§_-R2A§.location);
            return;
         }
         §_-Vm§.instance.close();
         location = this.§_-R2A§.location;
         quest = this.§_-R2A§.type;
         questDifficulty = this.§_-R2A§.§_-QN§;
         Analytics.§_-R2A§();
         §_-EI§.load(function():void
         {
            §_-Bm§.set(§_-T2o§.§_-T1J§);
            §_-92z§.start(location);
            §_-R1c§.§_-D1D§ = quest;
            §_-R1c§.§_-12D§ = questDifficulty;
         },true);
      }
      
      private function §_-X2A§() : DisplayObject
      {
         var _loc4_:DisplayObject = null;
         var _loc1_:Sprite = new Sprite();
         var _loc2_:§_-22V§ = new §_-22V§(this.§_-R2A§.award,0,0,§_-K1D§);
         _loc1_.addChild(_loc2_);
         §_-jB§.§_-Y2B§(_loc2_,§_-81v§);
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.numChildren)
         {
            _loc4_ = _loc1_.getChildAt(_loc3_);
            if(_loc4_ is ImageIconNut)
            {
               new §_-Hb§(_loc4_,gls("Орехи"));
            }
            if(_loc4_ is ImageIconExp)
            {
               new §_-Hb§(_loc4_,gls("Опыт"));
            }
            if(_loc4_ is ImageIconMana)
            {
               new §_-Hb§(_loc4_,gls("Мана"));
            }
            _loc3_++;
         }
         _loc1_.x = 296.5 + int((168 - _loc1_.width) * 0.5);
         _loc1_.y = 22;
         return _loc1_;
      }
   }
}

