package §_-53r§
{
   import §_-82h§.§_-81Y§;
   import §_-hd§.§_-01M§;
   import §_-td§.GameMapNet;
   import game.mainGame.SquirrelGame;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   import starling.display.Sprite;
   
   public class §_-c2J§ extends GameMapNet
   {
      
      private static const §_-X12§:Number = 0.33;
      
      private static const §_-b1E§:int = 9;
      
      private static const §_-H2m§:int = 100;
      
      private static const §_-C3F§:int = 5;
      
      private static const §_-O1e§:int = 3;
      
      private static const §_-Q1Q§:int = 3;
      
      private static const §_-Cw§:int = 8;
      
      private static const §_-v16§:int = 0;
      
      private static const §_-uL§:int = 3;
      
      private static const §_-n2r§:int = 5;
      
      private static var volcanoData:Array = null;
      
      private static var §_-k2i§:Boolean = false;
      
      private static var §_-i2b§:Number = 0;
      
      private var views:Vector.<§_-81Y§>;
      
      private var §_-W2s§:Sprite = null;
      
      public var §_-a1m§:int = 0;
      
      public var §_-03q§:int = 0;
      
      public function §_-c2J§(param1:SquirrelGame)
      {
         var _loc3_:§_-81Y§ = null;
         this.views = new Vector.<§_-81Y§>(0);
         super(param1);
         var _loc2_:int = 0;
         while(_loc2_ < §_-b1E§)
         {
            _loc3_ = new §_-81Y§();
            _loc3_.x = _loc2_ * §_-H2m§;
            _loc3_.y = §_-Zy§.§_-02T§ + 8;
            _loc3_.deactivate();
            §_-J2J§(_loc3_);
            this.views.push(_loc3_);
            _loc2_++;
         }
         this.§_-W2s§ = §_-01M§.§_-D1J§(new PlatformGroundWild(),§_-Zy§.§_-21V§,32);
         this.§_-W2s§.y = §_-Zy§.§_-02T§ + 32;
         §_-J2J§(this.§_-W2s§);
         §_-p1V§.§_-63T§(this.§_-t29§);
      }
      
      override public function round(param1:Array) : void
      {
         var _loc2_:int = 0;
         super.round(param1);
         switch(param1[0])
         {
            case §_-s2l§.ROUND_START:
               volcanoData = null;
               §_-i2b§ = 0;
               §_-k2i§ = false;
               this.§_-03q§ = 0;
               this.§_-a1m§ = 0;
               _loc2_ = 0;
               while(_loc2_ < this.views.length)
               {
                  this.views[_loc2_].deactivate();
                  _loc2_++;
               }
               if(!this.game.squirrels.isSynchronizing)
               {
                  return;
               }
               this.§_-h1O§();
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
         §_-p1V§.§_-B3x§(this.§_-t29§);
      }
      
      override protected function §_-qv§() : *
      {
         var _loc1_:Object = super.§_-qv§();
         var _loc2_:Array = [this.§_-a1m§,this.§_-03q§,volcanoData,(this.game.squirrels as §_-u2b§).§_-F2B§];
         _loc1_.push({"volcano":_loc2_});
         return _loc1_;
      }
      
      override protected function §_-a2f§(param1:*, param2:Boolean = false) : void
      {
         param1 = §_-m1v§(param1);
         var _loc3_:Object = param1.pop();
         super.§_-a2f§(param1,true);
         if(!("volcano" in _loc3_))
         {
            return;
         }
         this.§_-a1m§ = _loc3_["volcano"][0];
         this.§_-03q§ = _loc3_["volcano"][1];
         volcanoData = _loc3_["volcano"][2];
         (this.game.squirrels as §_-u2b§).§_-F2B§ = _loc3_["volcano"][3];
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         super.§_-x2f§(param1);
         if(param1.type != §_-s2l§.§_-1q§)
         {
            return;
         }
         var _loc2_:Object = param1[1];
         if("volcanoData" in _loc2_)
         {
            volcanoData = _loc2_["volcanoData"];
         }
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(§_-i2b§ > 0)
         {
            §_-i2b§ = Math.max(0,§_-i2b§ - param1);
            return;
         }
         if(!§_-k2i§)
         {
            return;
         }
         var _loc2_:Array = this.§_-33a§;
         var _loc3_:§_-d10§ = Hero.self as §_-d10§;
         if(!_loc3_ || _loc3_.isDead)
         {
            return;
         }
         var _loc4_:int = _loc3_.position.x * Game.§_-12A§;
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_.length)
         {
            if(_loc2_[_loc5_] * §_-H2m§ <= _loc4_ && _loc4_ <= §_-H2m§ + _loc2_[_loc5_] * §_-H2m§)
            {
               §_-i2b§ = §_-X12§;
               --_loc3_.health;
               if(_loc3_.health == 0)
               {
                  _loc3_.§_-kl§();
               }
               break;
            }
            _loc5_++;
         }
      }
      
      private function §_-h1O§() : void
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         volcanoData = [];
         var _loc1_:int = int((this.§_-51u§ - §_-C3F§) / §_-Cw§);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = [];
            _loc4_ = 0;
            while(_loc4_ < §_-b1E§)
            {
               _loc3_.push(_loc4_);
               _loc4_++;
            }
            _loc5_ = [];
            _loc6_ = Math.min(§_-b1E§ - 1,§_-Q1Q§ + _loc2_ / §_-O1e§);
            while(_loc5_.length < _loc6_)
            {
               _loc5_.push(_loc3_.splice(int(Math.random() * _loc3_.length),1));
            }
            volcanoData.push(_loc5_);
            _loc2_++;
         }
         Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"volcanoData":volcanoData}));
      }
      
      private function get §_-33a§() : Array
      {
         if(volcanoData == null)
         {
            return [];
         }
         var _loc1_:int = this.§_-03q§ / §_-Cw§;
         if(volcanoData.length <= _loc1_)
         {
            return [];
         }
         return volcanoData[_loc1_];
      }
      
      private function §_-t29§() : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         if(this.§_-j2F§ != §_-s2l§.ROUND_START)
         {
            return;
         }
         if(this.§_-a1m§ < §_-C3F§)
         {
            ++this.§_-a1m§;
            return;
         }
         var _loc1_:int = this.§_-03q§ % §_-Cw§;
         switch(_loc1_)
         {
            case §_-v16§:
               _loc2_ = this.§_-33a§;
               _loc3_ = 0;
               while(_loc3_ < _loc2_.length)
               {
                  this.views[_loc2_[_loc3_]].§_-C1M§();
                  _loc3_++;
               }
               GameSounds.play("volcano_prepare");
               break;
            case §_-uL§:
               §_-k2i§ = true;
               _loc2_ = this.§_-33a§;
               _loc3_ = 0;
               while(_loc3_ < _loc2_.length)
               {
                  this.views[_loc2_[_loc3_]].active();
                  _loc3_++;
               }
               GameSounds.play("volcano_active2");
               break;
            case §_-n2r§:
               §_-k2i§ = false;
               _loc2_ = this.§_-33a§;
               _loc3_ = 0;
               while(_loc3_ < _loc2_.length)
               {
                  this.views[_loc2_[_loc3_]].deactivate();
                  _loc3_++;
               }
         }
         ++this.§_-03q§;
      }
   }
}

