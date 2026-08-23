package §_-bN§
{
   import §_-1k§.§_-A1q§;
   import §_-1k§.§_-E13§;
   import §_-1k§.§_-G2R§;
   import §_-1k§.§_-T1F§;
   import §_-1k§.§_-U2F§;
   import §_-1k§.§_-d1z§;
   import §_-1k§.§_-i4§;
   import §_-1k§.§_-k2q§;
   import §_-1k§.§_-md§;
   import §_-1k§.§_-s1v§;
   import §_-B1G§.ScrollPane;
   import §_-X1k§.NotificationManager;
   import §_-X1k§.§_-Ac§;
   import §_-X1k§.§_-i2a§;
   import events.GameEvent;
   import events.PostEvent;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import views.§_-O2E§;
   
   public class §_-q1i§ extends Dialog
   {
      
      private static const §_-i2u§:int = 85;
      
      private static var _instance:§_-q1i§ = null;
      
      private var §_-01f§:Vector.<§_-G2R§> = new Vector.<§_-G2R§>();
      
      private var §_-A29§:Vector.<§_-G2R§> = new Vector.<§_-G2R§>();
      
      private var §_-W18§:ScrollPane = null;
      
      private var §_-61v§:Sprite = null;
      
      private var §_-41G§:§_-i5§ = null;
      
      private var §_-h1T§:Boolean = false;
      
      public function §_-q1i§()
      {
         super(gls("Почта"),true,true,null,false);
         §_-i2a§.addEventListener(GameEvent.EVENT_CHANGE,this.§_-G1o§);
         §_-i2a§.addEventListener(GameEvent.GIFT_CHANGE,this.§_-6d§);
         §_-i2a§.addEventListener(GameEvent.ON_CHANGE,this.update);
         this.init();
         this.§_-F1X§();
      }
      
      public static function show() : void
      {
         if(_instance == null)
         {
            _instance = new §_-q1i§();
         }
         _instance.show();
         _instance.redrawModalBackdrop();
         if(§_-Ac§.§_-91§(§_-Ac§.§_-T1Z§))
         {
            §_-i2a§.§_-w2f§();
         }
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         super.hide(param1);
         §_-O2E§.hide();
      }
      
      override protected function redrawModalBackdrop() : void
      {
         this.graphics.clear();
         this.graphics.beginFill(0,0.1);
         this.graphics.drawRect(-this.x,-this.y,Game.starling.stage.stageWidth,Game.starling.stage.stageHeight);
      }
      
      private function §_-F1X§() : void
      {
         this.§_-fG§(§_-i2a§.§_-B3I§);
         this.§_-Z2o§(§_-i2a§.§_-J2W§);
         this.update();
      }
      
      private function init() : void
      {
         this.§_-W18§ = new ScrollPane();
         this.§_-W18§.x = 10;
         this.§_-W18§.y = 10;
         this.§_-W18§.setSize(780,425);
         addChild(this.§_-W18§);
         this.§_-61v§ = new Sprite();
         this.§_-W18§.source = this.§_-61v§;
         this.§_-41G§ = new §_-i5§(gls("У тебя нет сообщений"),0,190,new TextFormat(null,16,6697728,true));
         this.§_-41G§.x = int((780 - this.§_-41G§.textWidth) * 0.5);
         place();
         this.width = 815;
         this.height = 500;
      }
      
      private function §_-G1o§(param1:GameEvent) : void
      {
         this.§_-Z2o§(§_-i2a§.§_-J2W§);
         this.update();
      }
      
      private function §_-6d§(param1:GameEvent) : void
      {
         this.§_-fG§(§_-i2a§.§_-B3I§);
         this.update();
      }
      
      private function update(param1:GameEvent = null) : void
      {
         this.§_-h1T§ = true;
         while(this.§_-61v§.numChildren > 0)
         {
            this.§_-61v§.removeChildAt(0);
         }
         this.§_-A29§ = this.§_-01f§.filter(this.§_-dG§);
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-A29§.length)
         {
            this.§_-A29§[_loc2_].y = §_-i2u§ * _loc2_;
            this.§_-A29§[_loc2_].§_-O1s§();
            this.§_-61v§.addChild(this.§_-A29§[_loc2_]);
            _loc2_++;
         }
         if(this.§_-A29§.length == 0)
         {
            this.§_-61v§.addChild(this.§_-41G§);
            §_-L1H§.hide(NotificationManager.§_-T1Z§);
         }
         this.§_-61v§.graphics.clear();
         this.§_-61v§.graphics.beginFill(0,0);
         this.§_-61v§.graphics.drawRect(0,0,1,§_-i2u§ * this.§_-A29§.length);
         this.§_-W18§.update();
         this.§_-h1T§ = false;
      }
      
      private function §_-Y2c§(param1:PostEvent) : void
      {
         if(!this.§_-h1T§)
         {
            if(param1.id != 0)
            {
               Connection.§_-e2T§(§_-u1O§.§_-K1I§,param1.id);
            }
            this.§_-72j§(param1.id,false);
         }
         else
         {
            setTimeout(this.§_-Y2c§,1000,param1);
         }
      }
      
      private function §_-e1I§(param1:PostEvent) : void
      {
         if(!this.§_-h1T§)
         {
            this.§_-72j§(param1.id,true);
         }
         else
         {
            setTimeout(this.§_-e1I§,1000,param1);
         }
      }
      
      private function §_-72j§(param1:int, param2:Boolean = false) : void
      {
         var _loc3_:* = 0;
         while(_loc3_ < this.§_-01f§.length)
         {
            if(this.§_-01f§[_loc3_].eventId == param1)
            {
               if(param2 == this.§_-01f§[_loc3_] is §_-T1F§)
               {
                  this.§_-01f§.splice(_loc3_,1);
                  break;
               }
            }
            _loc3_++;
         }
         var _loc4_:Boolean = false;
         _loc3_ = 0;
         while(_loc3_ < this.§_-A29§.length)
         {
            if(_loc4_)
            {
               this.§_-A29§[_loc3_].y -= §_-i2u§;
            }
            else if(this.§_-A29§[_loc3_].eventId == param1)
            {
               if(param2 == this.§_-A29§[_loc3_] is §_-T1F§)
               {
                  if(this.§_-61v§.contains(this.§_-A29§[_loc3_]))
                  {
                     this.§_-61v§.removeChild(this.§_-A29§[_loc3_]);
                  }
                  this.§_-A29§.splice(_loc3_,1);
                  _loc3_--;
                  _loc4_ = true;
               }
            }
            _loc3_++;
         }
         if(!_loc4_)
         {
            return;
         }
         this.§_-61v§.graphics.clear();
         this.§_-61v§.graphics.beginFill(0,0);
         this.§_-61v§.graphics.drawRect(0,0,1,§_-i2u§ * this.§_-A29§.length);
         this.§_-W18§.update();
         if(this.§_-A29§.length == 0)
         {
            this.§_-61v§.addChild(this.§_-41G§);
            §_-L1H§.hide(NotificationManager.§_-T1Z§);
         }
      }
      
      private function §_-fG§(param1:Array) : void
      {
         var _loc4_:§_-G2R§ = null;
         var _loc2_:Vector.<§_-G2R§> = this.§_-01f§.filter(this.§_-H1q§);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc2_[_loc3_].removeEventListener(PostEvent.REMOVE_EVENT,this.§_-e1I§);
            _loc3_++;
         }
         this.§_-01f§ = this.§_-01f§.filter(this.§_-017§);
         if(param1.length == 0)
         {
            return;
         }
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = new §_-T1F§(param1[_loc3_],param1[_loc3_ + 1],param1[_loc3_ + 2],param1[_loc3_ + 3]);
            _loc4_.addEventListener(PostEvent.REMOVE_EVENT,this.§_-e1I§);
            this.§_-01f§.push(_loc4_);
            _loc3_ += 4;
         }
      }
      
      private function §_-Z2o§(param1:Array) : void
      {
         var _loc4_:§_-G2R§ = null;
         var _loc2_:Vector.<§_-G2R§> = this.§_-01f§.filter(this.§_-017§);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc2_[_loc3_].removeEventListener(PostEvent.REMOVE_EVENT,this.§_-Y2c§);
            _loc3_++;
         }
         this.§_-01f§ = this.§_-01f§.filter(this.§_-H1q§);
         if(param1.length == 0)
         {
            return;
         }
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = null;
            switch(param1[_loc3_ + 1])
            {
               case §_-s2l§.§_-s1a§:
                  _loc4_ = new §_-k2q§(param1[_loc3_],param1[_loc3_ + 1],param1[_loc3_ + 4]);
                  break;
               case §_-s2l§.MAP_APPROVED:
               case §_-s2l§.§_-W1y§:
               case §_-s2l§.§_-03y§:
                  _loc4_ = new §_-i4§(param1[_loc3_],param1[_loc3_ + 1],param1[_loc3_ + 3],param1[_loc3_ + 4]);
                  break;
               case §_-s2l§.§_-33l§:
               case §_-s2l§.§_-z1l§:
                  _loc4_ = new §_-md§(param1[_loc3_],param1[_loc3_ + 1],param1[_loc3_ + 2],param1[_loc3_ + 3],param1[_loc3_ + 4]);
                  break;
               case §_-s2l§.§_-k1N§:
               case §_-s2l§.§_-63p§:
               case §_-s2l§.§_-Xy§:
                  _loc4_ = new §_-s1v§(param1[_loc3_],param1[_loc3_ + 1],param1[_loc3_ + 3],param1[_loc3_ + 4]);
                  break;
               case §_-s2l§.§_-r2w§:
                  _loc4_ = new §_-s1v§(param1[_loc3_],param1[_loc3_ + 1],param1[_loc3_ + 3],param1[_loc3_ + 4]);
                  break;
               case §_-s2l§.§_-Y2P§:
                  _loc4_ = new §_-s1v§(param1[_loc3_],param1[_loc3_ + 1],param1[_loc3_ + 3],param1[_loc3_ + 4]);
                  break;
               case §_-s2l§.§_-z1I§:
                  _loc4_ = new §_-d1z§(param1[_loc3_],param1[_loc3_ + 2],param1[_loc3_ + 4]);
                  break;
               case §_-s2l§.§_-x1J§:
                  _loc4_ = new §_-A1q§(param1[_loc3_],param1[_loc3_ + 2],param1[_loc3_ + 3],param1[_loc3_ + 4]);
                  break;
               case §_-s2l§.§_-nQ§:
                  _loc4_ = new §_-E13§(param1[_loc3_],param1[_loc3_ + 1],param1[_loc3_ + 2],param1[_loc3_ + 4]);
                  break;
               case §_-s2l§.§_-C2n§:
               case §_-s2l§.§_-e4§:
               case §_-s2l§.§_-b1j§:
                  _loc4_ = new §_-U2F§(param1[_loc3_],param1[_loc3_ + 1],param1[_loc3_ + 3],param1[_loc3_ + 4]);
            }
            if(_loc4_ != null)
            {
               _loc4_.addEventListener(PostEvent.REMOVE_EVENT,this.§_-Y2c§);
               this.§_-01f§.push(_loc4_);
            }
            _loc3_ += 5;
         }
      }
      
      private function §_-dG§(param1:§_-G2R§, param2:int, param3:Vector.<§_-G2R§>) : Boolean
      {
         return param1.time <= Game.§_-i24§ + int(getTimer() / 1000);
      }
      
      private function §_-017§(param1:§_-G2R§, param2:int, param3:Vector.<§_-G2R§>) : Boolean
      {
         return !(param1 is §_-T1F§);
      }
      
      private function §_-H1q§(param1:§_-G2R§, param2:int, param3:Vector.<§_-G2R§>) : Boolean
      {
         return param1 is §_-T1F§;
      }
   }
}

