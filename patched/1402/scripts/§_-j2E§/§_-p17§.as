package §_-j2E§
{
   import §_-TK§.§_-f1u§;
   import §_-Vu§.§_-h25§;
   import §_-X1k§.§_-P2x§;
   import dragonBones.§_-83b§;
   import flash.events.Event;
   import sounds.GameSounds;
   
   public class §_-p17§ extends §_-92f§
   {
      
      private static const §_-Q2G§:String = "Cloak";
      
      private static const §_-Ce§:String = "jumpDragon";
      
      private static const §_-22x§:Number = 1;
      
      private static const §_-531§:Number = 1.5;
      
      private var §_-01h§:§_-f1u§;
      
      public function §_-p17§(param1:Hero)
      {
         var hero:Hero = param1;
         super(hero);
         this.§_-01h§ = new §_-f1u§(new JumpDust());
         this.§_-01h§.loop = false;
         this.§_-01h§.gotoAndStop(0);
         this.§_-01h§.visible = false;
         this.§_-01h§.addEventListener(Event.COMPLETE,function(param1:Event):void
         {
            §_-01h§.gotoAndStop(0);
            §_-01h§.visible = false;
         });
         this.§_-S2A§ = §_-7d§;
         this.§_-i1J§ = true;
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get canTurnOff() : Boolean
      {
         return false;
      }
      
      override public function get activeTime() : Number
      {
         return 10;
      }
      
      override public function get totalCooldown() : Number
      {
         return 20;
      }
      
      override public function dispose() : void
      {
         this.§_-01h§.removeFromParent(true);
         super.dispose();
      }
      
      override protected function activate() : void
      {
         var _loc1_:§_-83b§ = null;
         var _loc2_:* = undefined;
         super.activate();
         if(§_-x2b§ || !this.hero)
         {
            return;
         }
         this.hero.heroView.§_-C1X§(new ButtonMagic());
         this.hero.addEventListener(Hero.§_-y2y§,this.§_-G2J§);
         this.hero.§_-F1u§.push(§_-22x§);
         this.hero.jumpVelocity *= §_-531§;
         if(Boolean(this.hero.heroView) && Boolean(this.hero.heroView.armature))
         {
            _loc1_ = this.hero.heroView.armature.§_-i2v§(§_-Q2G§);
            if(_loc1_)
            {
               _loc1_.§_-M1A§ = §_-Ce§;
               try
               {
                  _loc2_ = _loc1_.§_-KY§().pop();
                  if(_loc2_)
                  {
                     _loc2_.childArmature.animation.timeScale += 2;
                  }
               }
               catch(e:Error)
               {
               }
            }
         }
      }
      
      override protected function deactivate() : void
      {
         var index:int;
         var bone:§_-83b§;
         super.deactivate();
         if(§_-x2b§)
         {
            return;
         }
         this.hero.heroView.§_-A2l§();
         this.hero.removeEventListener(Hero.§_-y2y§,this.§_-G2J§);
         index = this.hero.§_-F1u§.indexOf(§_-22x§);
         if(index != -1)
         {
            this.hero.§_-F1u§.splice(index,1);
         }
         this.hero.jumpVelocity /= §_-531§;
         if(this.hero.player["worn_packages"].indexOf(§_-P2x§.§_-F2K§) == -1)
         {
            return;
         }
         bone = this.hero.heroView.armature.§_-i2v§(§_-Q2G§);
         if(!bone)
         {
            return;
         }
         bone.§_-M1A§ = null;
         try
         {
            bone.§_-KY§().pop().childArmature.animation.timeScale = bone.§_-KY§().pop().childArmature.animation.timeScale - 2;
         }
         catch(e:Error)
         {
            §_-p2U§.add("deactivate",e);
         }
      }
      
      private function §_-G2J§(param1:Event) : void
      {
         var _loc2_:§_-83b§ = null;
         var _loc3_:* = undefined;
         if(!this || !this.active || !this.hero || !this.hero.onFloor || !param1 || !this.§_-01h§)
         {
            return;
         }
         this.§_-01h§.x = this.hero.getPosition().x;
         this.§_-01h§.y = this.hero.getPosition().y;
         this.§_-01h§.rotation = this.hero.rotation;
         this.§_-01h§.scaleX = (this.hero.heroView.direction ? 1 : -1) * Math.abs(this.§_-01h§.scaleX);
         if(!this.§_-01h§.parentStarling && this.hero.game.map != null)
         {
            this.hero.game.map.§_-h2T§.§_-J2J§(this.§_-01h§.getStarlingView());
         }
         if(Boolean(this.hero) && Boolean(this.hero.heroView) && Boolean(this.hero.heroView.armature))
         {
            _loc2_ = this.hero.heroView.armature.§_-i2v§(§_-Q2G§);
            if(Boolean(_loc2_) && Boolean(_loc2_.§_-KY§()))
            {
               _loc3_ = _loc2_.§_-KY§().pop();
               if(Boolean(_loc3_) && Boolean(_loc3_.childArmature) && Boolean(_loc3_.childArmature.animation))
               {
                  _loc3_.childArmature.animation.gotoAndPlay(§_-Ce§,-1,-1,1,0,"dragon",§_-h25§.§_-fX§);
               }
            }
            if(this.hero.isSelf)
            {
               GameSounds.play(§_-n19§);
            }
         }
         this.§_-01h§.gotoAndPlay(0);
         this.§_-01h§.visible = true;
      }
   }
}

