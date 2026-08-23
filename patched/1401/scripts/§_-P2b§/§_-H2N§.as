package §_-P2b§
{
   import §_-S2§.Perk;
   import §_-T1r§.§_-03i§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-H2N§ extends Perk
   {
      
      protected const §_-iP§:String = "appearance";
      
      protected const §_-y2M§:String = "flying";
      
      protected const §_-F1N§:String = "smoke";
      
      protected const §_-Cy§:String = "acceleration";
      
      protected const §_-Y1q§:String = "teleport";
      
      protected const §_-VU§:String = "activate";
      
      protected const §_-g1g§:String = "drop";
      
      protected const §_-U1O§:String = "wings";
      
      protected var buff:§_-03i§ = null;
      
      public var §_-j2Y§:int = 0;
      
      public function §_-H2N§(param1:Hero)
      {
         super(param1);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(Boolean(this.buff) && this.activeTime != 0)
         {
            this.buff.update(100 - 100 * (this.§_-f1z§ / this.activeTime));
         }
      }
      
      override public function get available() : Boolean
      {
         if(!Game.toggle)
         {
            if(!this.hero)
            {
               return false;
            }
            var _loc1_:Boolean = this.§_-3V§ == 0 && this.§_-D1n§ < this.maxCountUse;
            var _loc2_:Boolean = this.switchable && this.canTurnOff;
            return Boolean((Boolean(this.§_-g2C§) && (this.active ? _loc2_ : _loc1_)) & this.§_-DA§);
         }
         return super.available && !this.isBlock && this.§_-DA§;
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         if(this.hero == null)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-S2I§.§_-82J§:
               if(param1[0].indexOf(this.hero.id) != -1)
               {
                  this.active = false;
               }
               break;
            case §_-S2I§.§_-Vs§:
               if(param1[0] == 1)
               {
                  return;
               }
               if(this.hero.id == param1[1])
               {
                  this.active = false;
               }
               break;
            case §_-S2I§.§_-F2m§:
               if(this.hero.id == param1[0])
               {
                  this.active = false;
               }
               break;
            case §_-S2I§.§_-R28§:
               if(this.hero.id == param1[0])
               {
                  this.active = false;
               }
               break;
            case §_-S2I§.§_-w1R§:
               if(param1[2] == §_-S2I§.§_-L2G§)
               {
                  return;
               }
               if(param1[1] != this.§_-i2D§ || param1[0] != this.hero.id)
               {
                  return;
               }
               this.active = param1[2] == §_-S2I§.§_-EY§;
         }
      }
      
      override protected function get packets() : Array
      {
         return [§_-S2I§.§_-w1R§,§_-S2I§.§_-82J§,§_-S2I§.§_-Vs§,§_-S2I§.§_-F2m§,§_-S2I§.§_-R28§];
      }
      
      override protected function activate() : void
      {
         var _loc1_:Sprite = null;
         var _loc2_:DisplayObject = null;
         super.activate();
         if(this is §_-01l§)
         {
            this.§_-Zp§();
         }
         if(!this.switchable || this.hero.id != Game.selfId)
         {
            return;
         }
         if(!this.buff)
         {
            _loc1_ = new Sprite();
            _loc2_ = §_-6L§.§_-Gi§(this.§_-i2D§);
            _loc2_.scaleX = _loc2_.scaleY = 0.8;
            _loc2_.x = _loc2_.y = 15;
            _loc1_.addChild(_loc2_);
            this.buff = new §_-03i§(_loc1_,1,0.25,§_-6L§.§_-l7§(this.§_-i2D§));
         }
         this.hero.§_-Aj§(this.buff);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(Boolean(this.hero) && Boolean(this.buff))
         {
            this.hero.removeBuff(this.buff);
         }
      }
      
      protected function get §_-DA§() : Boolean
      {
         return this.hero.isSquirrel || this.hero.isScrat;
      }
      
      protected function §_-Zp§() : void
      {
         if(!Game.toggle)
         {
            return;
         }
         var _loc1_:Vector.<§_-H2N§> = this.hero.perkController.perksClothes;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            if(!(!(_loc1_[_loc2_] is §_-01l§) || _loc1_[_loc2_] == this || !_loc1_[_loc2_].active))
            {
               _loc1_[_loc2_].active = false;
               Connection.§_-Li§(§_-h2B§.§_-w1R§,_loc1_[_loc2_].§_-i2D§,§_-S2I§.§_-33T§,0,"");
            }
            _loc2_++;
         }
      }
   }
}

