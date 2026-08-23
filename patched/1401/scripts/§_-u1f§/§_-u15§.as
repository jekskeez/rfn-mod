package §_-u1f§
{
   import §_-A2x§.GameMapNet;
   import §_-C1l§.§_-a2§;
   import §_-f17§.§_-t2u§;
   import game.mainGame.SquirrelGame;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   import starling.display.Sprite;
   
   public class §_-u15§ extends GameMapNet
   {
      
      private static const §_-d2w§:Number = 0.33;
      
      private static const §_-n28§:int = 9;
      
      private static const §_-c2Z§:int = 100;
      
      private static const §_-nH§:int = 5;
      
      private static const §_-m2k§:int = 3;
      
      private static const §_-G1H§:int = 3;
      
      private static const §_-GT§:int = 8;
      
      private static const §_-D2y§:int = 0;
      
      private static const §_-d20§:int = 3;
      
      private static const §_-52M§:int = 5;
      
      private static var volcanoData:Array = null;
      
      private static var §_-Y1i§:Boolean = false;
      
      private static var §_-l1E§:Number = 0;
      
      private var views:Vector.<§_-t2u§>;
      
      private var §_-I2d§:Sprite = null;
      
      public var §_-42v§:int = 0;
      
      public var §_-G1o§:int = 0;
      
      public function §_-u15§(param1:SquirrelGame)
      {
         var _loc3_:§_-t2u§ = null;
         this.views = new Vector.<§_-t2u§>(0);
         super(param1);
         var _loc2_:int = 0;
         while(_loc2_ < §_-n28§)
         {
            _loc3_ = new §_-t2u§();
            _loc3_.x = _loc2_ * §_-c2Z§;
            _loc3_.y = §_-a9§.§_-31m§ + 8;
            _loc3_.deactivate();
            §_-83v§(_loc3_);
            this.views.push(_loc3_);
            _loc2_++;
         }
         this.§_-I2d§ = §_-a2§.§_-A3m§(new PlatformGroundWild(),§_-a9§.§_-9o§,32);
         this.§_-I2d§.y = §_-a9§.§_-31m§ + 32;
         §_-83v§(this.§_-I2d§);
         §_-01Y§.§_-c9§(this.§_-H5§);
      }
      
      override public function round(param1:Array) : void
      {
         var _loc2_:int = 0;
         super.round(param1);
         switch(param1[0])
         {
            case §_-S2I§.ROUND_START:
               volcanoData = null;
               §_-l1E§ = 0;
               §_-Y1i§ = false;
               this.§_-G1o§ = 0;
               this.§_-42v§ = 0;
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
               this.§_-Q1o§();
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
         §_-01Y§.§_-l2K§(this.§_-H5§);
      }
      
      override protected function §_-931§() : *
      {
         var _loc1_:Object = super.§_-931§();
         var _loc2_:Array = [this.§_-42v§,this.§_-G1o§,volcanoData,(this.game.squirrels as §_-63b§).§_-pa§];
         _loc1_.push({"volcano":_loc2_});
         return _loc1_;
      }
      
      override protected function §_-sb§(param1:*, param2:Boolean = false) : void
      {
         param1 = §_-a1O§(param1);
         var _loc3_:Object = param1.pop();
         super.§_-sb§(param1,true);
         if(!("volcano" in _loc3_))
         {
            return;
         }
         this.§_-42v§ = _loc3_["volcano"][0];
         this.§_-G1o§ = _loc3_["volcano"][1];
         volcanoData = _loc3_["volcano"][2];
         (this.game.squirrels as §_-63b§).§_-pa§ = _loc3_["volcano"][3];
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         super.§_-o2C§(param1);
         if(param1.type != §_-S2I§.§_-b1y§)
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
         if(§_-l1E§ > 0)
         {
            §_-l1E§ = Math.max(0,§_-l1E§ - param1);
            return;
         }
         if(!§_-Y1i§)
         {
            return;
         }
         var _loc2_:Array = this.§_-A3K§;
         var _loc3_:§_-L1H§ = Hero.self as §_-L1H§;
         if(!_loc3_ || _loc3_.isDead)
         {
            return;
         }
         var _loc4_:int = _loc3_.position.x * Game.§_-x2P§;
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_.length)
         {
            if(_loc2_[_loc5_] * §_-c2Z§ <= _loc4_ && _loc4_ <= §_-c2Z§ + _loc2_[_loc5_] * §_-c2Z§)
            {
               §_-l1E§ = §_-d2w§;
               --_loc3_.health;
               if(_loc3_.health == 0)
               {
                  _loc3_.§_-h2r§();
               }
               break;
            }
            _loc5_++;
         }
      }
      
      private function §_-Q1o§() : void
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         volcanoData = [];
         var _loc1_:int = int((this.§_-23J§ - §_-nH§) / §_-GT§);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = [];
            _loc4_ = 0;
            while(_loc4_ < §_-n28§)
            {
               _loc3_.push(_loc4_);
               _loc4_++;
            }
            _loc5_ = [];
            _loc6_ = Math.min(§_-n28§ - 1,§_-G1H§ + _loc2_ / §_-m2k§);
            while(_loc5_.length < _loc6_)
            {
               _loc5_.push(_loc3_.splice(int(Math.random() * _loc3_.length),1));
            }
            volcanoData.push(_loc5_);
            _loc2_++;
         }
         Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"volcanoData":volcanoData}));
      }
      
      private function get §_-A3K§() : Array
      {
         if(volcanoData == null)
         {
            return [];
         }
         var _loc1_:int = this.§_-G1o§ / §_-GT§;
         if(volcanoData.length <= _loc1_)
         {
            return [];
         }
         return volcanoData[_loc1_];
      }
      
      private function §_-H5§() : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         if(this.§_-F2g§ != §_-S2I§.ROUND_START)
         {
            return;
         }
         if(this.§_-42v§ < §_-nH§)
         {
            ++this.§_-42v§;
            return;
         }
         var _loc1_:int = this.§_-G1o§ % §_-GT§;
         switch(_loc1_)
         {
            case §_-D2y§:
               _loc2_ = this.§_-A3K§;
               _loc3_ = 0;
               while(_loc3_ < _loc2_.length)
               {
                  this.views[_loc2_[_loc3_]].§_-21w§();
                  _loc3_++;
               }
               GameSounds.play("volcano_prepare");
               break;
            case §_-d20§:
               §_-Y1i§ = true;
               _loc2_ = this.§_-A3K§;
               _loc3_ = 0;
               while(_loc3_ < _loc2_.length)
               {
                  this.views[_loc2_[_loc3_]].active();
                  _loc3_++;
               }
               GameSounds.play("volcano_active2");
               break;
            case §_-52M§:
               §_-Y1i§ = false;
               _loc2_ = this.§_-A3K§;
               _loc3_ = 0;
               while(_loc3_ < _loc2_.length)
               {
                  this.views[_loc2_[_loc3_]].deactivate();
                  _loc3_++;
               }
         }
         ++this.§_-G1o§;
      }
   }
}

