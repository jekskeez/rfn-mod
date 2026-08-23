package game.mainGame
{
   import Box2D.Common.Math.b2Math;
   import §_-83V§.Box;
   import §_-RI§.§_-h2I§;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFormat;
   import game.mainGame.entity.§_-03s§;
   
   public class §_-xt§ extends §_-h2I§
   {
      
      private static const §_-O1o§:Number = 0.1;
      
      private static const §_-L1M§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,16777215,true);
      
      private static const §_-j1N§:Array = [new DropShadowFilter(0,45,3475457,1,2,2,7)];
      
      private var §_-E2N§:§_-h2I§ = new §_-h2I§();
      
      private var §_-I2v§:Array = [];
      
      private var §_-W2L§:Array = [];
      
      private var §_-np§:Boolean;
      
      public var §_-11§:Boolean;
      
      private var sprite:Sprite = new Sprite();
      
      private var §_-b2B§:Object = {};
      
      private var §_-gJ§:Sprite = new CastDelete();
      
      public function §_-xt§()
      {
         super();
         this.sprite.graphics.beginFill(16777215,0.81);
         this.sprite.graphics.drawRoundRectComplex(0,0,50,50,5,5,5,5);
         this.sprite.graphics.endFill();
         this.sprite.scaleX = this.sprite.scaleY = 0.7;
         §_-83v§(this.§_-E2N§);
         this.touchable = false;
      }
      
      public function dispose() : void
      {
         var _loc1_:String = null;
         if(this.§_-b2B§)
         {
            for(_loc1_ in this.§_-b2B§)
            {
               this.§_-b2B§[_loc1_].removeFromParent();
            }
         }
      }
      
      override public function get visible() : Boolean
      {
         return super.visible;
      }
      
      override public function set visible(param1:Boolean) : void
      {
         super.visible = param1;
         if(param1)
         {
            Game.stage.addEventListener(Event.ENTER_FRAME,this.onUpdate,false,0,true);
         }
         else
         {
            Game.stage.removeEventListener(Event.ENTER_FRAME,this.onUpdate);
         }
      }
      
      public function set §_-H1T§(param1:Boolean) : void
      {
         this.§_-E2N§.visible = param1;
      }
      
      public function get §_-o1h§() : Boolean
      {
         return this.§_-np§;
      }
      
      public function §_-81W§() : void
      {
         while(this.§_-E2N§.numChildren > 0)
         {
            this.§_-E2N§.§_-n2T§(0);
         }
         while(numChildren > 0)
         {
            §_-n2T§(0);
         }
      }
      
      public function set §_-o1h§(param1:Boolean) : void
      {
         this.§_-np§ = param1;
         this.redraw();
      }
      
      public function §_-Cw§(param1:Array, param2:Array) : void
      {
         if(this.§_-11§)
         {
            param1.unshift(Box);
            param2.unshift("Z");
         }
         if(param1 == null || param2 == null)
         {
            return;
         }
         if(param1.length != param2.length)
         {
            return;
         }
         if(param1.join() == this.§_-I2v§.join() && param2.join() == this.§_-W2L§.join())
         {
            return;
         }
         this.§_-I2v§ = param1;
         this.§_-W2L§ = param2;
         this.redraw();
      }
      
      private function onUpdate(param1:Event) : void
      {
         var _loc2_:Boolean = this.mouseX * this.scaleX > 0 && this.mouseX * this.scaleX < this.width && this.mouseY * this.scaleY > 0 && this.mouseY * this.scaleY < this.height;
         this.alpha += _loc2_ ? -§_-O1o§ : §_-O1o§;
         this.alpha = b2Math.Clamp(this.alpha,0,1);
      }
      
      private function redraw() : void
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         var _loc4_:Class = null;
         var _loc5_:Sprite = null;
         var _loc6_:Sprite = null;
         var _loc7_:§_-22V§ = null;
         var _loc1_:Sprite = new Sprite();
         while(this.§_-E2N§.numChildren > 0)
         {
            this.§_-E2N§.§_-n2T§(0);
         }
         this.sprite.addChild(this.§_-gJ§);
         this.§_-b2B§["delete"] = new §_-h2I§(this.sprite,true);
         this.sprite.removeChild(this.§_-gJ§);
         this.§_-E2N§.§_-83v§(this.§_-b2B§["delete"]);
         for(_loc2_ in this.§_-I2v§)
         {
            while(_loc1_.numChildren > 0)
            {
               _loc1_.removeChildAt(0);
            }
            _loc1_.scaleX = _loc1_.scaleY = 1;
            _loc3_ = int(_loc2_);
            _loc4_ = this.§_-I2v§[_loc3_];
            _loc1_.addChild(this.sprite);
            _loc5_ = §_-03s§.§_-a2D§(_loc4_) as Sprite;
            _loc6_ = new Sprite();
            _loc5_.x = 0;
            _loc5_.y = 0;
            _loc6_.addChild(_loc5_);
            _loc6_.scaleX = _loc6_.scaleY = 0.7;
            if(_loc4_ == Box)
            {
               _loc5_.x = -_loc5_.width * 0.5;
               _loc5_.y = -_loc5_.height * 0.5;
            }
            _loc6_.x = _loc1_.width * 0.5;
            _loc6_.y = _loc1_.height * 0.5;
            _loc1_.addChild(_loc6_);
            _loc7_ = new §_-22V§(this.§_-W2L§[_loc3_],0,0,§_-L1M§);
            _loc7_.x = 23;
            _loc7_.y = 20;
            _loc7_.filters = §_-j1N§;
            _loc1_.addChild(_loc7_);
            if(this.§_-b2B§[_loc4_])
            {
               this.§_-b2B§[_loc4_].removeFromParent();
            }
            this.§_-b2B§[_loc4_] = new §_-h2I§(_loc1_,true);
            this.§_-b2B§[_loc4_].touchable = false;
            this.§_-b2B§[_loc4_].x = (_loc3_ + 1) * 40;
            this.§_-E2N§.§_-83v§(this.§_-b2B§[_loc4_]);
            this.§_-E2N§.touchable = false;
         }
      }
   }
}

