package §_-t14§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-8Q§.GameBody;
   import §_-X1k§.§_-gU§;
   import §_-v2M§.§_-A3f§;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   import game.mainGame.SquirrelGame;
   
   public class §_-j2w§ extends Hero
   {
      
      private static const §_-a2d§:int = 20000;
      
      private static const §_-n1Z§:Array = ["Cap","Glasses","Left_Boot","Left_glove","Left_sleeve_01","Left_sleeve_02","Pants","Pants_haunch","Right_Boot_stand","Right_glove","Tail_accessory_02","T-shirt"];
      
      public var §_-rD§:§_-A3f§ = new §_-A3f§();
      
      public var §_-T3§:int = -1;
      
      public var §_-A1L§:Boolean = false;
      
      public var §_-u2s§:Boolean = false;
      
      public var §_-Y1v§:Boolean = false;
      
      private var §_-u1f§:uint;
      
      public function §_-j2w§(param1:int, param2:b2World, param3:int = 0, param4:int = 0)
      {
         super(param1,param2,param3,param4);
         if(this.isSelf)
         {
            return;
         }
         this.§_-rD§.playerId = param1;
      }
      
      override public function get isSelf() : Boolean
      {
         return this.id == Game.selfId;
      }
      
      override public function get game() : SquirrelGame
      {
         return super.game as §_-62O§;
      }
      
      public function §_-N1Z§(param1:Array, param2:Array = null) : void
      {
         this.heroView.setClothing(param1,param2);
      }
      
      override public function remove() : void
      {
         super.remove();
         if(this.§_-u1f§ != 0)
         {
            clearInterval(this.§_-u1f§);
         }
         this.§_-u1f§ = 0;
         this.§_-rD§.§_-H2G§();
         this.§_-rD§.dispose();
         this.§_-rD§ = null;
      }
      
      override public function show() : void
      {
         if(this.inHollow)
         {
            return;
         }
         super.show();
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.isSelf || this.inHollow)
         {
            return;
         }
         if(this.§_-Y1v§)
         {
            this.jump(true);
         }
         if(this.§_-rD§.§_-hY§ || !this.§_-7h§)
         {
            return;
         }
         this.§_-dP§();
      }
      
      public function §_-i2X§() : void
      {
         this.§_-Y1v§ = false;
         this.§_-dP§();
      }
      
      public function §_-dP§() : void
      {
         if(!this.§_-u2s§ && (this.§_-A1L§ || this.§_-Y1v§))
         {
            return;
         }
         ++this.§_-T3§;
         if(this.§_-T3§ == §_-gU§.§_-Zs§ && this.shaman)
         {
            (this.game.map.§_-br§(§_-gU§.§_-I1g§) as GameBody).ghost = true;
         }
         var _loc1_:int = Math.abs(this.id);
         var _loc2_:Array = §_-gU§.§_-11p§(_loc1_,this.§_-T3§);
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:String = §_-gU§.§_-B3u§(_loc1_,_loc2_[0]);
         this.heroView.sendMessage(_loc3_);
         if(this.§_-u1f§)
         {
            clearInterval(this.§_-u1f§);
         }
         this.§_-u1f§ = setInterval(this.heroView.sendMessage,§_-a2d§,_loc3_);
         this.§_-rD§.actions = §_-gU§.§_-233§(_loc1_,_loc2_[1]);
         this.§_-rD§.§_-dP§();
         this.§_-A1L§ = !this.§_-u2s§ && _loc2_[1] < 0;
         this.§_-u2s§ = false;
      }
      
      private function get §_-7h§() : Boolean
      {
         if(Hero.self.position.x > this.position.x)
         {
            return true;
         }
         var _loc1_:b2Vec2 = Hero.self.position.Copy();
         _loc1_.Subtract(this.position);
         return !(_loc1_.Length() > 5 || _loc1_.Length() == 0);
      }
   }
}

