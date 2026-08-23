package game.mainGame
{
   import Box2D.Common.Math.b2Math;
   import §_-8Q§.Box;
   import §_-TK§.§_-aS§;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFormat;
   import game.mainGame.entity.§_-f1b§;
   
   public class §_-R13§ extends §_-aS§
   {
      
      private static const §_-92q§:Number = 0.1;
      
      private static const §_-J2D§:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,16777215,true);
      
      private static const §_-c13§:Array = [new DropShadowFilter(0,45,3475457,1,2,2,7)];
      
      private var §_-UI§:§_-aS§ = new §_-aS§();
      
      private var §_-t2G§:Array = [];
      
      private var §_-H2g§:Array = [];
      
      private var §_-E2s§:Boolean;
      
      public var §_-c17§:Boolean;
      
      private var sprite:Sprite = new Sprite();
      
      private var §_-Z2Q§:Object = {};
      
      private var §_-lN§:Sprite = new CastDelete();
      
      public function §_-R13§()
      {
         super();
         this.sprite.graphics.beginFill(16777215,0.81);
         this.sprite.graphics.drawRoundRectComplex(0,0,50,50,5,5,5,5);
         this.sprite.graphics.endFill();
         this.sprite.scaleX = this.sprite.scaleY = 0.7;
         §_-J2J§(this.§_-UI§);
         this.touchable = false;
      }
      
      public function dispose() : void
      {
         var _loc1_:String = null;
         if(this.§_-Z2Q§)
         {
            for(_loc1_ in this.§_-Z2Q§)
            {
               this.§_-Z2Q§[_loc1_].removeFromParent();
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
      
      public function set §_-a2Z§(param1:Boolean) : void
      {
         this.§_-UI§.visible = param1;
      }
      
      public function get §_-Z2X§() : Boolean
      {
         return this.§_-E2s§;
      }
      
      public function §_-J20§() : void
      {
         while(this.§_-UI§.numChildren > 0)
         {
            this.§_-UI§.§_-av§(0);
         }
         while(numChildren > 0)
         {
            §_-av§(0);
         }
      }
      
      public function set §_-Z2X§(param1:Boolean) : void
      {
         this.§_-E2s§ = param1;
         this.redraw();
      }
      
      public function §_-N1g§(param1:Array, param2:Array) : void
      {
         if(this.§_-c17§)
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
         if(param1.join() == this.§_-t2G§.join() && param2.join() == this.§_-H2g§.join())
         {
            return;
         }
         this.§_-t2G§ = param1;
         this.§_-H2g§ = param2;
         this.redraw();
      }
      
      private function onUpdate(param1:Event) : void
      {
         var _loc2_:Boolean = this.mouseX * this.scaleX > 0 && this.mouseX * this.scaleX < this.width && this.mouseY * this.scaleY > 0 && this.mouseY * this.scaleY < this.height;
         this.alpha += _loc2_ ? -§_-92q§ : §_-92q§;
         this.alpha = b2Math.Clamp(this.alpha,0,1);
      }
      
      private function redraw() : void
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         var _loc4_:Class = null;
         var _loc5_:Sprite = null;
         var _loc6_:Sprite = null;
         var _loc7_:§_-i5§ = null;
         var _loc1_:Sprite = new Sprite();
         while(this.§_-UI§.numChildren > 0)
         {
            this.§_-UI§.§_-av§(0);
         }
         this.sprite.addChild(this.§_-lN§);
         this.§_-Z2Q§["delete"] = new §_-aS§(this.sprite,true);
         this.sprite.removeChild(this.§_-lN§);
         this.§_-UI§.§_-J2J§(this.§_-Z2Q§["delete"]);
         for(_loc2_ in this.§_-t2G§)
         {
            while(_loc1_.numChildren > 0)
            {
               _loc1_.removeChildAt(0);
            }
            _loc1_.scaleX = _loc1_.scaleY = 1;
            _loc3_ = int(_loc2_);
            _loc4_ = this.§_-t2G§[_loc3_];
            _loc1_.addChild(this.sprite);
            _loc5_ = §_-f1b§.§_-425§(_loc4_) as Sprite;
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
            _loc7_ = new §_-i5§(this.§_-H2g§[_loc3_],0,0,§_-J2D§);
            _loc7_.x = 23;
            _loc7_.y = 20;
            _loc7_.filters = §_-c13§;
            _loc1_.addChild(_loc7_);
            if(this.§_-Z2Q§[_loc4_])
            {
               this.§_-Z2Q§[_loc4_].removeFromParent();
            }
            this.§_-Z2Q§[_loc4_] = new §_-aS§(_loc1_,true);
            this.§_-Z2Q§[_loc4_].touchable = false;
            this.§_-Z2Q§[_loc4_].x = (_loc3_ + 1) * 40;
            this.§_-UI§.§_-J2J§(this.§_-Z2Q§[_loc4_]);
            this.§_-UI§.touchable = false;
         }
      }
   }
}

