package §_-j2E§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-8Q§.GameBody;
   import §_-8Q§.§_-O2k§;
   import §_-8Q§.§_-t20§;
   import §_-8Q§.§_-u1i§;
   import §_-A1G§.§_-w10§;
   import §_-j2H§.§_-01b§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-G2z§ extends §_-92f§
   {
      
      private static const §_-D26§:Number = 2;
      
      private static const §_-A2L§:Number = 4;
      
      private static const §_-WC§:Number = -50;
      
      private var squirrels:Array = [];
      
      private var §_-82p§:b2Vec2 = new b2Vec2(0,§_-WC§);
      
      private var §_-K1t§:Boolean = false;
      
      public function §_-G2z§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-B1U§;
         this.§_-i1J§ = true;
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get totalCooldown() : Number
      {
         return 20;
      }
      
      override public function get activeTime() : Number
      {
         return 10;
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.active || this.hero.id != Game.selfId)
         {
            return;
         }
         this.§_-n1n§();
      }
      
      override protected function get packets() : Array
      {
         return super.packets.concat([§_-s2l§.§_-u22§]);
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:GameBody = null;
         var _loc4_:Hero = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:* = null;
         switch(param1.type)
         {
            case §_-s2l§.§_-u22§:
               if(param1[0] != this.§_-T2a§ || this.hero.id == param1[1])
               {
                  return;
               }
               switch(param1[3])
               {
                  case 2:
                     _loc5_ = 0;
                     _loc6_ = int(this.hero.game.map.§_-j1c§().length);
                     while(_loc5_ < _loc6_)
                     {
                        _loc3_ = this.hero.game.map.§_-j1c§()[_loc5_];
                        if(Boolean(_loc3_ && _loc3_ is GameBody && _loc3_.visible && !(_loc3_ is §_-01b§) && !(_loc3_ is §_-O2k§)) && Boolean(!(_loc3_ is §_-u1i§)) && !(_loc3_ is §_-t20§))
                        {
                           _loc2_ = _loc3_;
                           if(Boolean(_loc2_) && _loc2_.id == param1[2])
                           {
                              _loc2_.body.SetLinearVelocity(this.hero.body.GetWorldVector(this.§_-82p§));
                           }
                        }
                        _loc5_++;
                     }
                     break;
                  case 1:
                     _loc4_ = this.hero.game.squirrels.get(param1[2]);
                     _loc4_.body.SetLinearVelocity(this.hero.body.GetWorldVector(this.§_-82p§));
               }
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
      
      override protected function activate() : void
      {
         var _loc1_:Hero = null;
         super.activate();
         this.hero.runSpeed *= §_-D26§;
         this.§_-K1t§ = true;
         this.hero.applyEffect(§_-w10§.§_-X1N§);
         this.hero.applyEffect(§_-w10§.§_-l1f§,-1);
         for each(_loc1_ in this.hero.game.squirrels.players)
         {
            if(!(_loc1_.isSelf || _loc1_.isHare || _loc1_.inHollow))
            {
               this.squirrels.push(_loc1_);
            }
         }
      }
      
      override protected function deactivate() : void
      {
         this.squirrels = [];
         super.deactivate();
         if(this.§_-K1t§)
         {
            this.hero.runSpeed /= §_-D26§;
            this.§_-K1t§ = false;
         }
         this.hero.disableEffect(§_-w10§.§_-X1N§);
         this.hero.disableEffect(§_-w10§.§_-l1f§);
      }
      
      private function §_-n1n§() : void
      {
         var _loc3_:Hero = null;
         var _loc1_:* = int(this.squirrels.length);
         var _loc2_:b2Vec2 = null;
         if(Math.abs(this.hero.velocity.Length()) < 10)
         {
            return;
         }
         while(_loc1_--)
         {
            _loc3_ = this.squirrels[_loc1_];
            if(!(_loc3_.inHollow || _loc3_.isDead))
            {
               _loc2_ = this.hero.position.Copy();
               _loc2_.Subtract(_loc3_.position);
               if(_loc2_.Length() <= §_-A2L§)
               {
                  _loc3_.body.SetLinearVelocity(this.hero.body.GetWorldVector(this.§_-82p§));
                  Connection.§_-e2T§(§_-u1O§.§_-u22§,this.§_-T2a§,_loc3_.id,1);
               }
            }
         }
         this.§_-wP§();
      }
      
      private function §_-wP§() : void
      {
         var _loc1_:GameBody = null;
         var _loc2_:* = null;
         var _loc3_:b2Vec2 = null;
         var _loc4_:int = 0;
         var _loc5_:int = int(this.hero.game.map.§_-j1c§().length);
         while(_loc4_ < _loc5_)
         {
            _loc2_ = this.hero.game.map.§_-j1c§()[_loc4_];
            if(Boolean(_loc2_ && _loc2_ is GameBody && _loc2_.visible && !(_loc2_ is §_-01b§) && !(_loc2_ is §_-O2k§)) && Boolean(!(_loc2_ is §_-u1i§)) && !(_loc2_ is §_-t20§))
            {
               _loc1_ = _loc2_;
               _loc3_ = this.hero.position.Copy();
               _loc3_.Subtract(_loc1_.position);
               if(_loc3_.Length() <= §_-A2L§)
               {
                  _loc1_.body.SetLinearVelocity(this.hero.body.GetWorldVector(this.§_-82p§));
                  Connection.§_-e2T§(§_-u1O§.§_-u22§,this.§_-T2a§,_loc1_.id,2);
               }
            }
            _loc4_++;
         }
      }
   }
}

