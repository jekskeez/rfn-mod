package §_-637§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Joints.b2Joint;
   import Box2D.Dynamics.Joints.b2JointEdge;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2World;
   import §_-83V§.GameBody;
   import §_-RI§.§_-d2d§;
   import §_-RI§.§_-h2I§;
   import §_-RI§.§_-v2j§;
   import §_-Y22§.§_-C2x§;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-03u§;
   import game.mainGame.entity.§_-63Q§;
   import utils.§_-41A§;
   import utils.§_-X2Z§;
   import utils.§_-x1Z§;
   
   public class BodyDestructor extends §_-h2I§ implements §_-63Q§, §_-J14§, §_-C2x§, §_-03u§
   {
      
      private var §_-rk§:GameBody = null;
      
      private var §_-j1O§:SquirrelGame;
      
      public function BodyDestructor()
      {
         super();
         var _loc1_:§_-d2d§ = new §_-d2d§(new Sight());
         _loc1_.loop = true;
         _loc1_.play();
         §_-83v§(_loc1_);
      }
      
      public function get position() : b2Vec2
      {
         return new b2Vec2(this.x / Game.§_-x2P§,this.y / Game.§_-x2P§);
      }
      
      public function set position(param1:b2Vec2) : void
      {
         var _loc4_:b2Body = null;
         var _loc5_:GameBody = null;
         this.x = param1.x * Game.§_-x2P§;
         this.y = param1.y * Game.§_-x2P§;
         if(!this.§_-j1O§)
         {
            return;
         }
         var _loc2_:Array = §_-41A§.§_-D4§(this.§_-j1O§.world,this.position,GameBody);
         var _loc3_:Array = [];
         for each(_loc4_ in _loc2_)
         {
            _loc5_ = _loc4_.GetUserData() as GameBody;
            if(Boolean(_loc5_) && Boolean(_loc5_.§_-u1M§) && (Boolean(Hero.self && Hero.self.shaman) || Boolean(_loc5_.playerId == Game.selfId)))
            {
               _loc3_.push(_loc4_.GetUserData());
            }
         }
         this.§_-S1c§ = §_-X2Z§.§_-C16§(_loc3_) as GameBody;
      }
      
      public function get angle() : Number
      {
         return 0;
      }
      
      public function set angle(param1:Number) : void
      {
      }
      
      public function build(param1:b2World) : void
      {
         var _loc3_:b2Body = null;
         var _loc4_:Array = null;
         var _loc5_:b2Joint = null;
         var _loc6_:b2JointEdge = null;
         var _loc2_:GameMap = (param1.userData as SquirrelGame).map;
         if(this.§_-S1c§ is GameBody)
         {
            _loc3_ = (this.§_-S1c§ as GameBody).body;
            _loc4_ = [];
            if(_loc3_ != null)
            {
               _loc6_ = _loc3_.GetJointList();
               while(_loc6_ != null)
               {
                  _loc4_.push(_loc6_.joint);
                  _loc6_ = _loc6_.next;
               }
            }
            for each(_loc5_ in _loc4_)
            {
               if(_loc5_.GetUserData() is §_-63Q§)
               {
                  _loc2_.remove(_loc5_.GetUserData());
               }
               if(_loc5_.GetUserData() is §_-C2x§)
               {
                  (_loc5_.GetUserData() as §_-C2x§).dispose();
               }
               param1.DestroyJoint(_loc5_);
               _loc5_.SetUserData("destroyed");
            }
         }
         _loc2_.remove(this.§_-S1c§,true);
         this.visible = false;
         _loc2_.remove(this);
         this.dispose();
      }
      
      public function set game(param1:SquirrelGame) : void
      {
         this.§_-j1O§ = param1;
      }
      
      public function §_-qB§() : void
      {
      }
      
      public function §_-PS§() : void
      {
      }
      
      public function §_-23§() : void
      {
      }
      
      public function dispose() : void
      {
         while(this.numChildren > 0)
         {
            §_-n2T§(0);
         }
         this.§_-S1c§ = null;
         this.game = null;
         this.removeFromParent(true);
      }
      
      public function §_-A1X§() : *
      {
         return [[this.position.x,this.position.y],this.§_-S1c§.id];
      }
      
      public function §_-41M§(param1:*) : void
      {
         this.position = new b2Vec2(param1[0][0],param1[0][1]);
         this.§_-S1c§ = this.§_-j1O§.map.getObject(param1[1]) as GameBody;
      }
      
      public function get §_-S1c§() : GameBody
      {
         return this.§_-rk§;
      }
      
      public function set §_-S1c§(param1:GameBody) : void
      {
         if(this.§_-rk§ == param1)
         {
            return;
         }
         if(Boolean(this.§_-rk§) && this.§_-rk§ is §_-v2j§)
         {
            (this.§_-rk§ as §_-h2I§).filters = [];
         }
         if(Boolean(param1) && param1 is §_-v2j§)
         {
            (param1 as §_-h2I§).filters = [§_-x1Z§.§_-m1p§];
         }
         this.§_-rk§ = param1;
      }
   }
}

