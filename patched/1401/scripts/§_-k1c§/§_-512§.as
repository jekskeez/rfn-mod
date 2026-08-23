package §_-k1c§
{
   import §_-81S§.§_-22z§;
   import §_-81S§.§_-33w§;
   import §_-81S§.§_-63P§;
   import §_-81S§.§_-e1x§;
   import §_-81S§.§_-fb§;
   import §_-81S§.§_-gm§;
   import §_-81S§.§_-h1P§;
   import §_-81S§.§_-i2f§;
   import §_-81S§.§_-u1V§;
   import §_-81S§.§_-z1o§;
   import §_-I10§.NotificationManager;
   import §_-I10§.§_-Bg§;
   import §_-I10§.§_-Q2v§;
   import §_-Kr§.ScrollPane;
   import events.GameEvent;
   import events.PostEvent;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import views.§_-U1§;
   
   public class §_-512§ extends Dialog
   {
      
      private static const §_-kI§:int = 85;
      
      private static var _instance:§_-512§ = null;
      
      private var §_-A2P§:Vector.<§_-33w§> = new Vector.<§_-33w§>();
      
      private var §_-S2J§:Vector.<§_-33w§> = new Vector.<§_-33w§>();
      
      private var §_-M1N§:ScrollPane = null;
      
      private var §_-sa§:Sprite = null;
      
      private var §_-2u§:§_-22V§ = null;
      
      private var §_-r6§:Boolean = false;
      
      public function §_-512§()
      {
         super(gls("Почта"),true,true,null,false);
         §_-Bg§.addEventListener(GameEvent.EVENT_CHANGE,this.§_-n2E§);
         §_-Bg§.addEventListener(GameEvent.GIFT_CHANGE,this.§_-4i§);
         §_-Bg§.addEventListener(GameEvent.ON_CHANGE,this.update);
         this.init();
         this.§_-Q1L§();
      }
      
      public static function show() : void
      {
         if(_instance == null)
         {
            _instance = new §_-512§();
         }
         _instance.show();
         _instance.redrawModalBackdrop();
         if(§_-Q2v§.§_-S2y§(§_-Q2v§.§_-V1P§))
         {
            §_-Bg§.§_-833§();
         }
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         super.hide(param1);
         §_-U1§.hide();
      }
      
      override protected function redrawModalBackdrop() : void
      {
         this.graphics.clear();
         this.graphics.beginFill(0,0.1);
         this.graphics.drawRect(-this.x,-this.y,Game.starling.stage.stageWidth,Game.starling.stage.stageHeight);
      }
      
      private function §_-Q1L§() : void
      {
         this.§_-D1z§(§_-Bg§.§_-Y9§);
         this.§_-hf§(§_-Bg§.§_-t2C§);
         this.update();
      }
      
      private function init() : void
      {
         this.§_-M1N§ = new ScrollPane();
         this.§_-M1N§.x = 10;
         this.§_-M1N§.y = 10;
         this.§_-M1N§.setSize(780,425);
         addChild(this.§_-M1N§);
         this.§_-sa§ = new Sprite();
         this.§_-M1N§.source = this.§_-sa§;
         this.§_-2u§ = new §_-22V§(gls("У тебя нет сообщений"),0,190,new TextFormat(null,16,6697728,true));
         this.§_-2u§.x = int((780 - this.§_-2u§.textWidth) * 0.5);
         place();
         this.width = 815;
         this.height = 500;
      }
      
      private function §_-n2E§(param1:GameEvent) : void
      {
         this.§_-hf§(§_-Bg§.§_-t2C§);
         this.update();
      }
      
      private function §_-4i§(param1:GameEvent) : void
      {
         this.§_-D1z§(§_-Bg§.§_-Y9§);
         this.update();
      }
      
      private function update(param1:GameEvent = null) : void
      {
         this.§_-r6§ = true;
         while(this.§_-sa§.numChildren > 0)
         {
            this.§_-sa§.removeChildAt(0);
         }
         this.§_-S2J§ = this.§_-A2P§.filter(this.§_-Q2X§);
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-S2J§.length)
         {
            this.§_-S2J§[_loc2_].y = §_-kI§ * _loc2_;
            this.§_-S2J§[_loc2_].§_-027§();
            this.§_-sa§.addChild(this.§_-S2J§[_loc2_]);
            _loc2_++;
         }
         if(this.§_-S2J§.length == 0)
         {
            this.§_-sa§.addChild(this.§_-2u§);
            §_-fO§.hide(NotificationManager.§_-V1P§);
         }
         this.§_-sa§.graphics.clear();
         this.§_-sa§.graphics.beginFill(0,0);
         this.§_-sa§.graphics.drawRect(0,0,1,§_-kI§ * this.§_-S2J§.length);
         this.§_-M1N§.update();
         this.§_-r6§ = false;
      }
      
      private function §_-Z2b§(param1:PostEvent) : void
      {
         if(!this.§_-r6§)
         {
            if(param1.id != 0)
            {
               Connection.§_-Li§(§_-h2B§.§_-tl§,param1.id);
            }
            this.§_-R1D§(param1.id,false);
         }
         else
         {
            setTimeout(this.§_-Z2b§,1000,param1);
         }
      }
      
      private function §_-k9§(param1:PostEvent) : void
      {
         if(!this.§_-r6§)
         {
            this.§_-R1D§(param1.id,true);
         }
         else
         {
            setTimeout(this.§_-k9§,1000,param1);
         }
      }
      
      private function §_-R1D§(param1:int, param2:Boolean = false) : void
      {
         var _loc3_:* = 0;
         while(_loc3_ < this.§_-A2P§.length)
         {
            if(this.§_-A2P§[_loc3_].eventId == param1)
            {
               if(param2 == this.§_-A2P§[_loc3_] is §_-63P§)
               {
                  this.§_-A2P§.splice(_loc3_,1);
                  break;
               }
            }
            _loc3_++;
         }
         var _loc4_:Boolean = false;
         _loc3_ = 0;
         while(_loc3_ < this.§_-S2J§.length)
         {
            if(_loc4_)
            {
               this.§_-S2J§[_loc3_].y -= §_-kI§;
            }
            else if(this.§_-S2J§[_loc3_].eventId == param1)
            {
               if(param2 == this.§_-S2J§[_loc3_] is §_-63P§)
               {
                  if(this.§_-sa§.contains(this.§_-S2J§[_loc3_]))
                  {
                     this.§_-sa§.removeChild(this.§_-S2J§[_loc3_]);
                  }
                  this.§_-S2J§.splice(_loc3_,1);
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
         this.§_-sa§.graphics.clear();
         this.§_-sa§.graphics.beginFill(0,0);
         this.§_-sa§.graphics.drawRect(0,0,1,§_-kI§ * this.§_-S2J§.length);
         this.§_-M1N§.update();
         if(this.§_-S2J§.length == 0)
         {
            this.§_-sa§.addChild(this.§_-2u§);
            §_-fO§.hide(NotificationManager.§_-V1P§);
         }
      }
      
      private function §_-D1z§(param1:Array) : void
      {
         var _loc4_:§_-33w§ = null;
         var _loc2_:Vector.<§_-33w§> = this.§_-A2P§.filter(this.§_-72Q§);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc2_[_loc3_].removeEventListener(PostEvent.REMOVE_EVENT,this.§_-k9§);
            _loc3_++;
         }
         this.§_-A2P§ = this.§_-A2P§.filter(this.§_-d2n§);
         if(param1.length == 0)
         {
            return;
         }
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = new §_-63P§(param1[_loc3_],param1[_loc3_ + 1],param1[_loc3_ + 2],param1[_loc3_ + 3]);
            _loc4_.addEventListener(PostEvent.REMOVE_EVENT,this.§_-k9§);
            this.§_-A2P§.push(_loc4_);
            _loc3_ += 4;
         }
      }
      
      private function §_-hf§(param1:Array) : void
      {
         var _loc4_:§_-33w§ = null;
         var _loc2_:Vector.<§_-33w§> = this.§_-A2P§.filter(this.§_-d2n§);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc2_[_loc3_].removeEventListener(PostEvent.REMOVE_EVENT,this.§_-Z2b§);
            _loc3_++;
         }
         this.§_-A2P§ = this.§_-A2P§.filter(this.§_-72Q§);
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
               case §_-S2I§.§_-m2d§:
                  _loc4_ = new §_-fb§(param1[_loc3_],param1[_loc3_ + 1],param1[_loc3_ + 4]);
                  break;
               case §_-S2I§.MAP_APPROVED:
               case §_-S2I§.§_-vl§:
               case §_-S2I§.§_-y24§:
                  _loc4_ = new §_-z1o§(param1[_loc3_],param1[_loc3_ + 1],param1[_loc3_ + 3],param1[_loc3_ + 4]);
                  break;
               case §_-S2I§.§_-Wx§:
               case §_-S2I§.§_-23Z§:
                  _loc4_ = new §_-e1x§(param1[_loc3_],param1[_loc3_ + 1],param1[_loc3_ + 2],param1[_loc3_ + 3],param1[_loc3_ + 4]);
                  break;
               case §_-S2I§.§_-11S§:
               case §_-S2I§.§_-Y1F§:
               case §_-S2I§.§_-vV§:
                  _loc4_ = new §_-u1V§(param1[_loc3_],param1[_loc3_ + 1],param1[_loc3_ + 3],param1[_loc3_ + 4]);
                  break;
               case §_-S2I§.§_-UB§:
                  _loc4_ = new §_-u1V§(param1[_loc3_],param1[_loc3_ + 1],param1[_loc3_ + 3],param1[_loc3_ + 4]);
                  break;
               case §_-S2I§.§_-z1J§:
                  _loc4_ = new §_-u1V§(param1[_loc3_],param1[_loc3_ + 1],param1[_loc3_ + 3],param1[_loc3_ + 4]);
                  break;
               case §_-S2I§.§_-ak§:
                  _loc4_ = new §_-h1P§(param1[_loc3_],param1[_loc3_ + 2],param1[_loc3_ + 4]);
                  break;
               case §_-S2I§.§_-hO§:
                  _loc4_ = new §_-i2f§(param1[_loc3_],param1[_loc3_ + 2],param1[_loc3_ + 3],param1[_loc3_ + 4]);
                  break;
               case §_-S2I§.§_-Z8§:
                  _loc4_ = new §_-22z§(param1[_loc3_],param1[_loc3_ + 1],param1[_loc3_ + 2],param1[_loc3_ + 4]);
                  break;
               case §_-S2I§.§_-S1s§:
               case §_-S2I§.§_-E1L§:
               case §_-S2I§.§_-U1s§:
                  _loc4_ = new §_-gm§(param1[_loc3_],param1[_loc3_ + 1],param1[_loc3_ + 3],param1[_loc3_ + 4]);
            }
            if(_loc4_ != null)
            {
               _loc4_.addEventListener(PostEvent.REMOVE_EVENT,this.§_-Z2b§);
               this.§_-A2P§.push(_loc4_);
            }
            _loc3_ += 5;
         }
      }
      
      private function §_-Q2X§(param1:§_-33w§, param2:int, param3:Vector.<§_-33w§>) : Boolean
      {
         return param1.time <= Game.§_-nE§ + int(getTimer() / 1000);
      }
      
      private function §_-d2n§(param1:§_-33w§, param2:int, param3:Vector.<§_-33w§>) : Boolean
      {
         return !(param1 is §_-63P§);
      }
      
      private function §_-72Q§(param1:§_-33w§, param2:int, param3:Vector.<§_-33w§>) : Boolean
      {
         return param1 is §_-63P§;
      }
   }
}

