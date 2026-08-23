package §_-t1l§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-83V§.GameBody;
   import §_-F1E§.§_-41e§;
   import §_-I10§.§_-C3U§;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   import game.mainGame.SquirrelGame;
   
   public class §_-Y1w§ extends Hero
   {
      
      private static const §_-s1W§:int = 20000;
      
      private static const §_-w4§:Array = ["Cap","Glasses","Left_Boot","Left_glove","Left_sleeve_01","Left_sleeve_02","Pants","Pants_haunch","Right_Boot_stand","Right_glove","Tail_accessory_02","T-shirt"];
      
      public var §_-c0§:§_-41e§ = new §_-41e§();
      
      public var §_-TE§:int = -1;
      
      public var §_-H1H§:Boolean = false;
      
      public var §_-83U§:Boolean = false;
      
      public var §_-a2r§:Boolean = false;
      
      private var §_-01X§:uint;
      
      public function §_-Y1w§(param1:int, param2:b2World, param3:int = 0, param4:int = 0)
      {
         super(param1,param2,param3,param4);
         if(this.isSelf)
         {
            return;
         }
         this.§_-c0§.playerId = param1;
      }
      
      override public function get isSelf() : Boolean
      {
         return this.id == Game.selfId;
      }
      
      override public function get game() : SquirrelGame
      {
         return super.game as §_-m28§;
      }
      
      public function §_-83Y§(param1:Array, param2:Array = null) : void
      {
         this.heroView.setClothing(param1,param2);
      }
      
      override public function remove() : void
      {
         super.remove();
         if(this.§_-01X§ != 0)
         {
            clearInterval(this.§_-01X§);
         }
         this.§_-01X§ = 0;
         this.§_-c0§.§_-k29§();
         this.§_-c0§.dispose();
         this.§_-c0§ = null;
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
         if(this.§_-a2r§)
         {
            this.jump(true);
         }
         if(this.§_-c0§.§_-A3w§ || !this.§_-8d§)
         {
            return;
         }
         this.§_-L1C§();
      }
      
      public function §_-K1E§() : void
      {
         this.§_-a2r§ = false;
         this.§_-L1C§();
      }
      
      public function §_-L1C§() : void
      {
         if(!this.§_-83U§ && (this.§_-H1H§ || this.§_-a2r§))
         {
            return;
         }
         ++this.§_-TE§;
         if(this.§_-TE§ == §_-C3U§.§_-53n§ && this.shaman)
         {
            (this.game.map.§_-xL§(§_-C3U§.§_-e1L§) as GameBody).ghost = true;
         }
         var _loc1_:int = Math.abs(this.id);
         var _loc2_:Array = §_-C3U§.§_-j2X§(_loc1_,this.§_-TE§);
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:String = §_-C3U§.§_-r1k§(_loc1_,_loc2_[0]);
         this.heroView.sendMessage(_loc3_);
         if(this.§_-01X§)
         {
            clearInterval(this.§_-01X§);
         }
         this.§_-01X§ = setInterval(this.heroView.sendMessage,§_-s1W§,_loc3_);
         this.§_-c0§.actions = §_-C3U§.§_-ud§(_loc1_,_loc2_[1]);
         this.§_-c0§.§_-L1C§();
         this.§_-H1H§ = !this.§_-83U§ && _loc2_[1] < 0;
         this.§_-83U§ = false;
      }
      
      private function get §_-8d§() : Boolean
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

