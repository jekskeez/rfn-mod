package §_-bm§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-C1l§.§_-a2§;
   import §_-K2c§.TouchEvent;
   import §_-K2c§.§_-e2m§;
   import §_-K2c§.§_-sj§;
   import §_-RI§.§_-h2I§;
   import flash.geom.Point;
   import game.mainGame.Cast;
   import game.mainGame.entity.§_-63Q§;
   import starling.core.Starling;
   import starling.display.Button;
   import starling.display.DisplayObject;
   import starling.display.Sprite;
   import starling.display.§_-Le§;
   
   public class §_-r1F§ extends Sprite
   {
      
      private static const §_-ND§:int = 60;
      
      private static const §_-b1n§:Array = [-0.4,0.4,2.55,3.14,3.73];
      
      private var §_-e2A§:Cast = null;
      
      private var §_-Q2I§:Button = null;
      
      private var §_-W1Z§:Button = null;
      
      private var §_-go§:Button = null;
      
      private var §_-S25§:Button = null;
      
      private var §_-Ji§:Button = null;
      
      private var §_-22f§:Vector.<§_-uC§>;
      
      private var §_-13h§:Vector.<Button>;
      
      private var hero:Hero = null;
      
      private var castObject:§_-h2I§ = null;
      
      private var §_-t5§:Boolean = false;
      
      private var §_-c2a§:Boolean = false;
      
      private var §_-N2K§:b2Vec2;
      
      private var §_-72n§:Boolean = false;
      
      private var §_-41U§:Point = null;
      
      private var §_-C4§:Point = null;
      
      public function §_-r1F§(param1:Cast)
      {
         var _loc4_:Button = null;
         this.§_-22f§ = new Vector.<§_-uC§>();
         this.§_-13h§ = new Vector.<Button>();
         this.§_-N2K§ = new b2Vec2();
         super();
         this.§_-e2A§ = param1;
         this.§_-W1Z§ = new Button(§_-a2§.getTexture(new BtnCastCancel()));
         this.§_-13h§.push(this.§_-W1Z§);
         this.§_-Q2I§ = new Button(§_-a2§.getTexture(new BtnCastApply()));
         this.§_-13h§.push(this.§_-Q2I§);
         this.§_-S25§ = new Button(§_-a2§.getTexture(new BtnCastRotate()));
         this.§_-13h§.push(this.§_-S25§);
         this.§_-Ji§ = new Button(§_-a2§.getTexture(new BtnCastMove()));
         this.§_-13h§.push(this.§_-Ji§);
         this.§_-go§ = new Button(§_-a2§.getTexture(new BtnCastApplyGhost()));
         this.§_-13h§.push(this.§_-go§);
         var _loc2_:int = 0;
         var _loc3_:int = int(this.§_-13h§.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this.§_-13h§[_loc2_];
            _loc4_.§_-x2x§();
            _loc4_.pivotY = 130;
            _loc4_.rotation = §_-b1n§[_loc2_];
            _loc4_.addEventListener(TouchEvent.§_-N1l§,this.§_-B1E§);
            addChild(_loc4_);
            _loc2_++;
         }
         this.visible = false;
         Starling.§_-y1l§.stage.addEventListener(TouchEvent.§_-N1l§,this.§_-G2G§);
      }
      
      public function §_-11i§() : void
      {
         this.visible = false;
      }
      
      public function §_-A18§() : void
      {
         if(this.castObject == null)
         {
            return;
         }
         this.x = this.castObject.x;
         this.y = this.castObject.y;
      }
      
      public function §_-Z2i§(param1:§_-63Q§, param2:Hero) : void
      {
         this.visible = true;
         this.hero = param2;
         this.castObject = param1 as §_-h2I§;
         this.castObject.touchable = false;
         var _loc3_:int = param2.heroView.direction ? -1 : 1;
         this.§_-N2K§.Set(param2.position.x + §_-ND§ / Game.§_-x2P§ * _loc3_,param2.position.y);
         (this.castObject as §_-63Q§).position = this.§_-N2K§;
         this.§_-kt§();
         this.§_-A18§();
      }
      
      public function set §_-11§(param1:Boolean) : void
      {
         this.§_-72n§ = param1;
         this.§_-go§.visible = param1;
      }
      
      public function get §_-11§() : Boolean
      {
         return this.§_-72n§;
      }
      
      public function set §_-o1h§(param1:Boolean) : void
      {
         this.§_-go§.state = param1 ? §_-Le§.DOWN : §_-Le§.UP;
      }
      
      public function §_-x1L§(param1:Array) : void
      {
         var _loc2_:§_-uC§ = null;
         var _loc3_:int = 0;
         var _loc4_:int = int(this.§_-22f§.length);
         while(_loc3_ < _loc4_)
         {
            this.§_-22f§[_loc3_].remove();
            _loc3_++;
         }
         this.§_-22f§ = new Vector.<§_-uC§>();
         _loc3_ = 0;
         _loc4_ = int(param1.length);
         while(_loc3_ < _loc4_)
         {
            if(Cast.§_-u2I§.indexOf(param1[_loc3_]) >= 0)
            {
               _loc2_ = new §_-uC§(param1[_loc3_],this.§_-a2n§);
               this.§_-22f§.push(_loc2_);
               addChild(_loc2_);
            }
            _loc3_++;
         }
         this.§_-kt§();
      }
      
      public function remove() : void
      {
         var _loc3_:Button = null;
         this.visible = false;
         Starling.§_-y1l§.stage.removeEventListener(TouchEvent.§_-N1l§,this.§_-G2G§);
         var _loc1_:int = 0;
         var _loc2_:int = int(this.§_-13h§.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this.§_-13h§[_loc1_];
            _loc3_.removeFromParent(true);
            _loc3_.removeEventListener(TouchEvent.§_-N1l§,this.§_-B1E§);
            _loc1_++;
         }
         _loc1_ = 0;
         _loc2_ = int(this.§_-22f§.length);
         while(_loc1_ < _loc2_)
         {
            this.§_-22f§[_loc1_].remove();
            _loc1_++;
         }
         this.§_-e2A§ = null;
         this.hero = null;
         this.castObject = null;
         this.§_-13h§ = null;
         this.§_-22f§ = null;
         this.§_-Q2I§ = null;
         this.§_-W1Z§ = null;
         this.§_-go§ = null;
         this.§_-S25§ = null;
         this.§_-Ji§ = null;
         removeFromParent(true);
      }
      
      private function §_-kt§() : void
      {
         var _loc1_:int = int(this.§_-22f§.length);
         if(_loc1_ == 0)
         {
            return;
         }
         var _loc2_:Number = 48 * Math.PI / 180;
         var _loc3_:Number = 113 * Math.PI / 180;
         var _loc4_:Number = 235 * Math.PI / 180;
         var _loc5_:Number = 300 * Math.PI / 180;
         var _loc6_:int = Math.ceil(_loc1_ / 2);
         this.§_-42d§(this.§_-22f§,0,_loc6_,_loc2_,_loc3_);
         this.§_-42d§(this.§_-22f§,_loc6_,_loc1_,_loc4_,_loc5_);
      }
      
      private function §_-42d§(param1:Vector.<§_-uC§>, param2:int, param3:int, param4:Number, param5:Number) : void
      {
         var _loc9_:§_-uC§ = null;
         var _loc6_:int = param3 - param2;
         if(_loc6_ <= 0)
         {
            return;
         }
         var _loc7_:Number = _loc6_ == 1 ? 0 : (param5 - param4) / (_loc6_ - 1);
         var _loc8_:int = 0;
         while(_loc8_ < _loc6_)
         {
            _loc9_ = param1[param2 + _loc8_];
            _loc9_.x = 0;
            _loc9_.y = 0;
            _loc9_.rotation = _loc6_ == 1 ? (param4 + param5) * 0.5 : param4 + _loc7_ * _loc8_;
            _loc8_++;
         }
      }
      
      private function §_-G2G§(param1:TouchEvent) : void
      {
         var _loc2_:Point = null;
         var _loc6_:§_-e2m§ = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         if(!this.visible || this.castObject == null)
         {
            return;
         }
         if(this.§_-t5§)
         {
            _loc6_ = param1.§_-H2o§(this,§_-sj§.§_-i23§);
            if(_loc6_)
            {
               _loc2_ = _loc6_.§_-l29§(this.§_-e2A§.getStarlingView());
               this.castObject.rotation = Math.atan2(_loc2_.y - this.castObject.y,_loc2_.x - this.castObject.x) * 180 / Math.PI;
               _loc2_ = _loc6_.§_-l29§(this.§_-S25§.parent);
               this.§_-S25§.x = _loc2_.x - 60;
               this.§_-S25§.y = _loc2_.y - 60;
            }
            return;
         }
         var _loc3_:§_-e2m§ = param1.§_-H2o§(Starling.§_-y1l§.stage,§_-sj§.§_-ML§);
         if(_loc3_)
         {
            this.§_-41U§ = _loc3_.§_-l29§(this.§_-e2A§.getStarlingView());
            this.§_-C4§ = new Point(this.castObject.x,this.castObject.y);
         }
         var _loc4_:§_-e2m§ = param1.§_-H2o§(Starling.§_-y1l§.stage,§_-sj§.§_-i23§);
         if(Boolean(_loc4_) && Boolean(this.§_-41U§))
         {
            _loc2_ = _loc4_.§_-l29§(this.§_-e2A§.getStarlingView());
            _loc7_ = this.§_-C4§.x + (_loc2_.x - this.§_-41U§.x);
            _loc8_ = this.§_-C4§.y + (_loc2_.y - this.§_-41U§.y);
            this.castObject.x = _loc7_;
            this.castObject.y = _loc8_;
            this.§_-N2K§.Set(_loc7_ / Game.§_-x2P§,_loc8_ / Game.§_-x2P§);
            (this.castObject as §_-63Q§).position = this.§_-N2K§;
            this.§_-A18§();
         }
         var _loc5_:§_-e2m§ = param1.§_-H2o§(Starling.§_-y1l§.stage,§_-sj§.§_-L23§);
         if(_loc5_)
         {
            this.§_-41U§ = null;
         }
      }
      
      private function §_-B1E§(param1:TouchEvent) : void
      {
         var _loc2_:§_-e2m§ = param1.§_-H2o§(param1.currentTarget as DisplayObject);
         if(_loc2_ == null)
         {
            return;
         }
         if(this.§_-W1Z§ == param1.currentTarget && _loc2_.§_-Q2S§ == §_-sj§.§_-L23§)
         {
            this.§_-e2A§.§_-m2C§();
            this.visible = false;
            this.§_-c2a§ = false;
         }
         else if(this.§_-S25§ == param1.currentTarget && _loc2_.§_-Q2S§ == §_-sj§.§_-ML§)
         {
            this.§_-t5§ = true;
            this.§_-c2a§ = false;
         }
         else if(this.§_-S25§ == param1.currentTarget && _loc2_.§_-Q2S§ == §_-sj§.§_-L23§)
         {
            this.§_-t5§ = this.§_-c2a§ = false;
            this.§_-S25§.x = 0;
            this.§_-S25§.y = 0;
         }
         else if(this.§_-go§ == param1.currentTarget && _loc2_.§_-Q2S§ == §_-sj§.§_-L23§)
         {
            this.§_-c2a§ = false;
            this.§_-e2A§.§_-Z1g§();
         }
         else if(this.§_-Q2I§ == param1.currentTarget && _loc2_.§_-Q2S§ == §_-sj§.§_-ML§)
         {
            this.§_-c2a§ = false;
            this.§_-e2A§.§_-qB§();
         }
         else if(this.§_-Q2I§ == param1.currentTarget && _loc2_.§_-Q2S§ == §_-sj§.§_-L23§)
         {
            this.§_-c2a§ = false;
            this.§_-e2A§.§_-PS§();
         }
         else if(Boolean(this.castObject) && Boolean(this.§_-Ji§ == param1.currentTarget) && _loc2_.§_-Q2S§ == §_-sj§.§_-ML§)
         {
            this.§_-c2a§ = true;
         }
         else if(Boolean(this.castObject) && Boolean(this.§_-Ji§ == param1.currentTarget) && _loc2_.§_-Q2S§ == §_-sj§.§_-L23§)
         {
            this.§_-c2a§ = false;
         }
         if(this.§_-Ji§ != param1.currentTarget && this.§_-S25§ != param1.currentTarget)
         {
            param1.stopPropagation();
         }
      }
      
      private function §_-a2n§(param1:§_-uC§) : void
      {
         this.§_-c2a§ = false;
         this.§_-e2A§.§_-T9§(param1.§_-F26§());
      }
   }
}

