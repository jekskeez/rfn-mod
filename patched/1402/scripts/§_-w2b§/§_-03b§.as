package §_-w2b§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-TK§.§_-aS§;
   import §_-f1T§.TouchEvent;
   import §_-f1T§.§_-01Z§;
   import §_-f1T§.§_-J1a§;
   import §_-hd§.§_-01M§;
   import flash.geom.Point;
   import game.mainGame.Cast;
   import game.mainGame.entity.§_-xn§;
   import starling.core.Starling;
   import starling.display.Button;
   import starling.display.DisplayObject;
   import starling.display.Sprite;
   import starling.display.§_-s11§;
   
   public class §_-03b§ extends Sprite
   {
      
      private static const §_-s1O§:int = 60;
      
      private static const §_-228§:Array = [-0.4,0.4,2.55,3.14,3.73];
      
      private var §_-339§:Cast = null;
      
      private var §_-j2z§:Button = null;
      
      private var §_-DW§:Button = null;
      
      private var §_-d1U§:Button = null;
      
      private var §_-83O§:Button = null;
      
      private var §_-51X§:Button = null;
      
      private var §_-U1N§:Vector.<§_-Q5§>;
      
      private var §_-nf§:Vector.<Button>;
      
      private var hero:Hero = null;
      
      private var castObject:§_-aS§ = null;
      
      private var §_-Q1p§:Boolean = false;
      
      private var §_-yg§:Boolean = false;
      
      private var §_-W1e§:b2Vec2;
      
      private var §_-H28§:Boolean = false;
      
      private var §_-d4§:Point = null;
      
      private var §_-b2B§:Point = null;
      
      public function §_-03b§(param1:Cast)
      {
         var _loc4_:Button = null;
         this.§_-U1N§ = new Vector.<§_-Q5§>();
         this.§_-nf§ = new Vector.<Button>();
         this.§_-W1e§ = new b2Vec2();
         super();
         this.§_-339§ = param1;
         this.§_-DW§ = new Button(§_-01M§.getTexture(new BtnCastCancel()));
         this.§_-nf§.push(this.§_-DW§);
         this.§_-j2z§ = new Button(§_-01M§.getTexture(new BtnCastApply()));
         this.§_-nf§.push(this.§_-j2z§);
         this.§_-83O§ = new Button(§_-01M§.getTexture(new BtnCastRotate()));
         this.§_-nf§.push(this.§_-83O§);
         this.§_-51X§ = new Button(§_-01M§.getTexture(new BtnCastMove()));
         this.§_-nf§.push(this.§_-51X§);
         this.§_-d1U§ = new Button(§_-01M§.getTexture(new BtnCastApplyGhost()));
         this.§_-nf§.push(this.§_-d1U§);
         var _loc2_:int = 0;
         var _loc3_:int = int(this.§_-nf§.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this.§_-nf§[_loc2_];
            _loc4_.§_-i18§();
            _loc4_.pivotY = 130;
            _loc4_.rotation = §_-228§[_loc2_];
            _loc4_.addEventListener(TouchEvent.§_-qu§,this.§_-03z§);
            addChild(_loc4_);
            _loc2_++;
         }
         this.visible = false;
         Starling.§_-n1s§.stage.addEventListener(TouchEvent.§_-qu§,this.§_-Mc§);
      }
      
      public function §_-8t§() : void
      {
         this.visible = false;
      }
      
      public function §_-N§() : void
      {
         if(this.castObject == null)
         {
            return;
         }
         this.x = this.castObject.x;
         this.y = this.castObject.y;
      }
      
      public function §_-j2j§(param1:§_-xn§, param2:Hero) : void
      {
         this.visible = true;
         this.hero = param2;
         this.castObject = param1 as §_-aS§;
         this.castObject.touchable = false;
         var _loc3_:int = param2.heroView.direction ? -1 : 1;
         this.§_-W1e§.Set(param2.position.x + §_-s1O§ / Game.§_-12A§ * _loc3_,param2.position.y);
         (this.castObject as §_-xn§).position = this.§_-W1e§;
         this.§_-I2e§();
         this.§_-N§();
      }
      
      public function set §_-c17§(param1:Boolean) : void
      {
         this.§_-H28§ = param1;
         this.§_-d1U§.visible = param1;
      }
      
      public function get §_-c17§() : Boolean
      {
         return this.§_-H28§;
      }
      
      public function set §_-Z2X§(param1:Boolean) : void
      {
         this.§_-d1U§.state = param1 ? §_-s11§.DOWN : §_-s11§.UP;
      }
      
      public function §_-F1P§(param1:Array) : void
      {
         var _loc2_:§_-Q5§ = null;
         var _loc3_:int = 0;
         var _loc4_:int = int(this.§_-U1N§.length);
         while(_loc3_ < _loc4_)
         {
            this.§_-U1N§[_loc3_].remove();
            _loc3_++;
         }
         this.§_-U1N§ = new Vector.<§_-Q5§>();
         _loc3_ = 0;
         _loc4_ = int(param1.length);
         while(_loc3_ < _loc4_)
         {
            if(Cast.§_-t2E§.indexOf(param1[_loc3_]) >= 0)
            {
               _loc2_ = new §_-Q5§(param1[_loc3_],this.§_-ar§);
               this.§_-U1N§.push(_loc2_);
               addChild(_loc2_);
            }
            _loc3_++;
         }
         this.§_-I2e§();
      }
      
      public function remove() : void
      {
         var _loc3_:Button = null;
         this.visible = false;
         Starling.§_-n1s§.stage.removeEventListener(TouchEvent.§_-qu§,this.§_-Mc§);
         var _loc1_:int = 0;
         var _loc2_:int = int(this.§_-nf§.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this.§_-nf§[_loc1_];
            _loc3_.removeFromParent(true);
            _loc3_.removeEventListener(TouchEvent.§_-qu§,this.§_-03z§);
            _loc1_++;
         }
         _loc1_ = 0;
         _loc2_ = int(this.§_-U1N§.length);
         while(_loc1_ < _loc2_)
         {
            this.§_-U1N§[_loc1_].remove();
            _loc1_++;
         }
         this.§_-339§ = null;
         this.hero = null;
         this.castObject = null;
         this.§_-nf§ = null;
         this.§_-U1N§ = null;
         this.§_-j2z§ = null;
         this.§_-DW§ = null;
         this.§_-d1U§ = null;
         this.§_-83O§ = null;
         this.§_-51X§ = null;
         removeFromParent(true);
      }
      
      private function §_-I2e§() : void
      {
         var _loc1_:int = int(this.§_-U1N§.length);
         if(_loc1_ == 0)
         {
            return;
         }
         var _loc2_:Number = 48 * Math.PI / 180;
         var _loc3_:Number = 113 * Math.PI / 180;
         var _loc4_:Number = 235 * Math.PI / 180;
         var _loc5_:Number = 300 * Math.PI / 180;
         var _loc6_:int = Math.ceil(_loc1_ / 2);
         this.§_-yH§(this.§_-U1N§,0,_loc6_,_loc2_,_loc3_);
         this.§_-yH§(this.§_-U1N§,_loc6_,_loc1_,_loc4_,_loc5_);
      }
      
      private function §_-yH§(param1:Vector.<§_-Q5§>, param2:int, param3:int, param4:Number, param5:Number) : void
      {
         var _loc9_:§_-Q5§ = null;
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
      
      private function §_-Mc§(param1:TouchEvent) : void
      {
         var _loc2_:Point = null;
         var _loc6_:§_-J1a§ = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         if(!this.visible || this.castObject == null)
         {
            return;
         }
         if(this.§_-Q1p§)
         {
            _loc6_ = param1.§_-d2S§(this,§_-01Z§.§_-kg§);
            if(_loc6_)
            {
               _loc2_ = _loc6_.§_-13l§(this.§_-339§.getStarlingView());
               this.castObject.rotation = Math.atan2(_loc2_.y - this.castObject.y,_loc2_.x - this.castObject.x) * 180 / Math.PI;
               _loc2_ = _loc6_.§_-13l§(this.§_-83O§.parent);
               this.§_-83O§.x = _loc2_.x - 60;
               this.§_-83O§.y = _loc2_.y - 60;
            }
            return;
         }
         var _loc3_:§_-J1a§ = param1.§_-d2S§(Starling.§_-n1s§.stage,§_-01Z§.§_-N1v§);
         if(_loc3_)
         {
            this.§_-d4§ = _loc3_.§_-13l§(this.§_-339§.getStarlingView());
            this.§_-b2B§ = new Point(this.castObject.x,this.castObject.y);
         }
         var _loc4_:§_-J1a§ = param1.§_-d2S§(Starling.§_-n1s§.stage,§_-01Z§.§_-kg§);
         if(Boolean(_loc4_) && Boolean(this.§_-d4§))
         {
            _loc2_ = _loc4_.§_-13l§(this.§_-339§.getStarlingView());
            _loc7_ = this.§_-b2B§.x + (_loc2_.x - this.§_-d4§.x);
            _loc8_ = this.§_-b2B§.y + (_loc2_.y - this.§_-d4§.y);
            this.castObject.x = _loc7_;
            this.castObject.y = _loc8_;
            this.§_-W1e§.Set(_loc7_ / Game.§_-12A§,_loc8_ / Game.§_-12A§);
            (this.castObject as §_-xn§).position = this.§_-W1e§;
            this.§_-N§();
         }
         var _loc5_:§_-J1a§ = param1.§_-d2S§(Starling.§_-n1s§.stage,§_-01Z§.§_-1Z§);
         if(_loc5_)
         {
            this.§_-d4§ = null;
         }
      }
      
      private function §_-03z§(param1:TouchEvent) : void
      {
         var _loc2_:§_-J1a§ = param1.§_-d2S§(param1.currentTarget as DisplayObject);
         if(_loc2_ == null)
         {
            return;
         }
         if(this.§_-DW§ == param1.currentTarget && _loc2_.§_-iR§ == §_-01Z§.§_-1Z§)
         {
            this.§_-339§.§_-A1k§();
            this.visible = false;
            this.§_-yg§ = false;
         }
         else if(this.§_-83O§ == param1.currentTarget && _loc2_.§_-iR§ == §_-01Z§.§_-N1v§)
         {
            this.§_-Q1p§ = true;
            this.§_-yg§ = false;
         }
         else if(this.§_-83O§ == param1.currentTarget && _loc2_.§_-iR§ == §_-01Z§.§_-1Z§)
         {
            this.§_-Q1p§ = this.§_-yg§ = false;
            this.§_-83O§.x = 0;
            this.§_-83O§.y = 0;
         }
         else if(this.§_-d1U§ == param1.currentTarget && _loc2_.§_-iR§ == §_-01Z§.§_-1Z§)
         {
            this.§_-yg§ = false;
            this.§_-339§.§_-u1t§();
         }
         else if(this.§_-j2z§ == param1.currentTarget && _loc2_.§_-iR§ == §_-01Z§.§_-N1v§)
         {
            this.§_-yg§ = false;
            this.§_-339§.§_-03o§();
         }
         else if(this.§_-j2z§ == param1.currentTarget && _loc2_.§_-iR§ == §_-01Z§.§_-1Z§)
         {
            this.§_-yg§ = false;
            this.§_-339§.§_-t2Q§();
         }
         else if(Boolean(this.castObject) && Boolean(this.§_-51X§ == param1.currentTarget) && _loc2_.§_-iR§ == §_-01Z§.§_-N1v§)
         {
            this.§_-yg§ = true;
         }
         else if(Boolean(this.castObject) && Boolean(this.§_-51X§ == param1.currentTarget) && _loc2_.§_-iR§ == §_-01Z§.§_-1Z§)
         {
            this.§_-yg§ = false;
         }
         if(this.§_-51X§ != param1.currentTarget && this.§_-83O§ != param1.currentTarget)
         {
            param1.stopPropagation();
         }
      }
      
      private function §_-ar§(param1:§_-Q5§) : void
      {
         this.§_-yg§ = false;
         this.§_-339§.§_-f23§(param1.§_-bl§());
      }
   }
}

