package §_-j2E§
{
   import §_-cm§.§_-Q2h§;
   import §_-n1h§.Perk;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-92f§ extends Perk
   {
      
      protected const §_-VF§:String = "appearance";
      
      protected const §_-j2B§:String = "flying";
      
      protected const §_-t1§:String = "smoke";
      
      protected const §_-B1U§:String = "acceleration";
      
      protected const §_-N2T§:String = "teleport";
      
      protected const §_-7d§:String = "activate";
      
      protected const §_-S2d§:String = "drop";
      
      protected const §_-n19§:String = "wings";
      
      protected var buff:§_-Q2h§ = null;
      
      public var §_-32l§:int = 0;
      
      public function §_-92f§(param1:Hero)
      {
         super(param1);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(Boolean(this.buff) && this.activeTime != 0)
         {
            this.buff.update(100 - 100 * (this.§_-h1§ / this.activeTime));
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
            var _loc1_:Boolean = this.§_-G27§ == 0 && this.§_-v2d§ < this.maxCountUse;
            var _loc2_:Boolean = this.switchable && this.canTurnOff;
            return Boolean((Boolean(this.§_-22i§) && (this.active ? _loc2_ : _loc1_)) & this.§_-O2Q§);
         }
         return super.available && !this.isBlock && this.§_-O2Q§;
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         if(this.hero == null)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-s2l§.§_-Yi§:
               if(param1[0].indexOf(this.hero.id) != -1)
               {
                  this.active = false;
               }
               break;
            case §_-s2l§.§_-n1f§:
               if(param1[0] == 1)
               {
                  return;
               }
               if(this.hero.id == param1[1])
               {
                  this.active = false;
               }
               break;
            case §_-s2l§.§_-v1r§:
               if(this.hero.id == param1[0])
               {
                  this.active = false;
               }
               break;
            case §_-s2l§.§_-V1b§:
               if(this.hero.id == param1[0])
               {
                  this.active = false;
               }
               break;
            case §_-s2l§.§_-C1i§:
               if(param1[2] == §_-s2l§.§_-j2o§)
               {
                  return;
               }
               if(param1[1] != this.§_-T2a§ || param1[0] != this.hero.id)
               {
                  return;
               }
               this.active = param1[2] == §_-s2l§.§_-x2Y§;
         }
      }
      
      override protected function get packets() : Array
      {
         return [§_-s2l§.§_-C1i§,§_-s2l§.§_-Yi§,§_-s2l§.§_-n1f§,§_-s2l§.§_-v1r§,§_-s2l§.§_-V1b§];
      }
      
      override protected function activate() : void
      {
         var _loc1_:Sprite = null;
         var _loc2_:DisplayObject = null;
         super.activate();
         if(this is §_-x1v§)
         {
            this.§_-m2i§();
         }
         if(!this.switchable || this.hero.id != Game.selfId)
         {
            return;
         }
         if(!this.buff)
         {
            _loc1_ = new Sprite();
            _loc2_ = §_-A11§.§_-51T§(this.§_-T2a§);
            _loc2_.scaleX = _loc2_.scaleY = 0.8;
            _loc2_.x = _loc2_.y = 15;
            _loc1_.addChild(_loc2_);
            this.buff = new §_-Q2h§(_loc1_,1,0.25,§_-A11§.§_-ya§(this.§_-T2a§));
         }
         this.hero.§_-W1T§(this.buff);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(Boolean(this.hero) && Boolean(this.buff))
         {
            this.hero.removeBuff(this.buff);
         }
      }
      
      protected function get §_-O2Q§() : Boolean
      {
         return this.hero.isSquirrel || this.hero.isScrat;
      }
      
      protected function §_-m2i§() : void
      {
         if(!Game.toggle)
         {
            return;
         }
         var _loc1_:Vector.<§_-92f§> = this.hero.perkController.perksClothes;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            if(!(!(_loc1_[_loc2_] is §_-x1v§) || _loc1_[_loc2_] == this || !_loc1_[_loc2_].active))
            {
               _loc1_[_loc2_].active = false;
               Connection.§_-e2T§(§_-u1O§.§_-C1i§,_loc1_[_loc2_].§_-T2a§,§_-s2l§.§_-31c§,0,"");
            }
            _loc2_++;
         }
      }
   }
}

