package §_-F5§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Joints.b2Joint;
   import Box2D.Dynamics.Joints.b2JointEdge;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2World;
   import §_-8Q§.GameBody;
   import §_-I2Y§.§_-l2r§;
   import §_-TK§.§_-51g§;
   import §_-TK§.§_-aS§;
   import §_-TK§.§_-f1u§;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-3l§;
   import game.mainGame.entity.§_-xn§;
   import utils.§_-11I§;
   import utils.§_-H1o§;
   import utils.§_-y1l§;
   
   public class BodyDestructor extends §_-aS§ implements §_-xn§, §_-Q1r§, §_-l2r§, §_-3l§
   {
      
      private var §_-Lx§:GameBody = null;
      
      private var §_-Y2e§:SquirrelGame;
      
      public function BodyDestructor()
      {
         super();
         var _loc1_:§_-f1u§ = new §_-f1u§(new Sight());
         _loc1_.loop = true;
         _loc1_.play();
         §_-J2J§(_loc1_);
      }
      
      public function get position() : b2Vec2
      {
         return new b2Vec2(this.x / Game.§_-12A§,this.y / Game.§_-12A§);
      }
      
      public function set position(param1:b2Vec2) : void
      {
         var _loc4_:b2Body = null;
         var _loc5_:GameBody = null;
         this.x = param1.x * Game.§_-12A§;
         this.y = param1.y * Game.§_-12A§;
         if(!this.§_-Y2e§)
         {
            return;
         }
         var _loc2_:Array = §_-11I§.§_-016§(this.§_-Y2e§.world,this.position,GameBody);
         var _loc3_:Array = [];
         for each(_loc4_ in _loc2_)
         {
            _loc5_ = _loc4_.GetUserData() as GameBody;
            if(Boolean(_loc5_) && Boolean(_loc5_.§_-124§) && (Boolean(Hero.self && Hero.self.shaman) || Boolean(_loc5_.playerId == Game.selfId)))
            {
               _loc3_.push(_loc4_.GetUserData());
            }
         }
         this.§_-T1V§ = §_-H1o§.§_-XF§(_loc3_) as GameBody;
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
         if(this.§_-T1V§ is GameBody)
         {
            _loc3_ = (this.§_-T1V§ as GameBody).body;
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
               if(_loc5_.GetUserData() is §_-xn§)
               {
                  _loc2_.remove(_loc5_.GetUserData());
               }
               if(_loc5_.GetUserData() is §_-l2r§)
               {
                  (_loc5_.GetUserData() as §_-l2r§).dispose();
               }
               param1.DestroyJoint(_loc5_);
               _loc5_.SetUserData("destroyed");
            }
         }
         _loc2_.remove(this.§_-T1V§,true);
         this.visible = false;
         _loc2_.remove(this);
         this.dispose();
      }
      
      public function set game(param1:SquirrelGame) : void
      {
         this.§_-Y2e§ = param1;
      }
      
      public function §_-03o§() : void
      {
      }
      
      public function §_-t2Q§() : void
      {
      }
      
      public function §_-Va§() : void
      {
      }
      
      public function dispose() : void
      {
         while(this.numChildren > 0)
         {
            §_-av§(0);
         }
         this.§_-T1V§ = null;
         this.game = null;
         this.removeFromParent(true);
      }
      
      public function §_-m1Y§() : *
      {
         return [[this.position.x,this.position.y],this.§_-T1V§.id];
      }
      
      public function §_-o2I§(param1:*) : void
      {
         this.position = new b2Vec2(param1[0][0],param1[0][1]);
         this.§_-T1V§ = this.§_-Y2e§.map.getObject(param1[1]) as GameBody;
      }
      
      public function get §_-T1V§() : GameBody
      {
         return this.§_-Lx§;
      }
      
      public function set §_-T1V§(param1:GameBody) : void
      {
         if(this.§_-Lx§ == param1)
         {
            return;
         }
         if(Boolean(this.§_-Lx§) && this.§_-Lx§ is §_-51g§)
         {
            (this.§_-Lx§ as §_-aS§).filters = [];
         }
         if(Boolean(param1) && param1 is §_-51g§)
         {
            (param1 as §_-aS§).filters = [§_-y1l§.§_-J1o§];
         }
         this.§_-Lx§ = param1;
      }
   }
}

