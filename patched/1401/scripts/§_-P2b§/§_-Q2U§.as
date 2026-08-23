package §_-P2b§
{
   import §_-I10§.§_-g2W§;
   import §_-N14§.§_-i2C§;
   import §_-RI§.§_-d2d§;
   import dragonBones.§_-TH§;
   import flash.events.Event;
   import sounds.GameSounds;
   
   public class §_-Q2U§ extends §_-H2N§
   {
      
      private static const §_-S1a§:String = "Cloak";
      
      private static const §_-B12§:String = "jumpDragon";
      
      private static const §_-c1f§:Number = 1;
      
      private static const §_-Z1D§:Number = 1.5;
      
      private var §_-vX§:§_-d2d§;
      
      public function §_-Q2U§(param1:Hero)
      {
         var hero:Hero = param1;
         super(hero);
         this.§_-vX§ = new §_-d2d§(new JumpDust());
         this.§_-vX§.loop = false;
         this.§_-vX§.gotoAndStop(0);
         this.§_-vX§.visible = false;
         this.§_-vX§.addEventListener(Event.COMPLETE,function(param1:Event):void
         {
            §_-vX§.gotoAndStop(0);
            §_-vX§.visible = false;
         });
         this.§_-it§ = §_-VU§;
         this.§_-mw§ = true;
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
         this.§_-vX§.removeFromParent(true);
         super.dispose();
      }
      
      override protected function activate() : void
      {
         var _loc1_:§_-TH§ = null;
         var _loc2_:* = undefined;
         super.activate();
         if(§_-g1M§ || !this.hero)
         {
            return;
         }
         this.hero.heroView.§_-420§(new ButtonMagic());
         this.hero.addEventListener(Hero.§_-H2j§,this.§_-gI§);
         this.hero.§_-j§.push(§_-c1f§);
         this.hero.jumpVelocity *= §_-Z1D§;
         if(Boolean(this.hero.heroView) && Boolean(this.hero.heroView.armature))
         {
            _loc1_ = this.hero.heroView.armature.§_-M1s§(§_-S1a§);
            if(_loc1_)
            {
               _loc1_.§_-r2q§ = §_-B12§;
               try
               {
                  _loc2_ = _loc1_.§_-81k§().pop();
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
         var bone:§_-TH§;
         super.deactivate();
         if(§_-g1M§)
         {
            return;
         }
         this.hero.heroView.§_-o2z§();
         this.hero.removeEventListener(Hero.§_-H2j§,this.§_-gI§);
         index = this.hero.§_-j§.indexOf(§_-c1f§);
         if(index != -1)
         {
            this.hero.§_-j§.splice(index,1);
         }
         this.hero.jumpVelocity /= §_-Z1D§;
         if(this.hero.player["worn_packages"].indexOf(§_-g2W§.§_-h2n§) == -1)
         {
            return;
         }
         bone = this.hero.heroView.armature.§_-M1s§(§_-S1a§);
         if(!bone)
         {
            return;
         }
         bone.§_-r2q§ = null;
         try
         {
            bone.§_-81k§().pop().childArmature.animation.timeScale = bone.§_-81k§().pop().childArmature.animation.timeScale - 2;
         }
         catch(e:Error)
         {
            §_-TQ§.add("deactivate",e);
         }
      }
      
      private function §_-gI§(param1:Event) : void
      {
         var _loc2_:§_-TH§ = null;
         var _loc3_:* = undefined;
         if(!this || !this.active || !this.hero || !this.hero.onFloor || !param1 || !this.§_-vX§)
         {
            return;
         }
         this.§_-vX§.x = this.hero.getPosition().x;
         this.§_-vX§.y = this.hero.getPosition().y;
         this.§_-vX§.rotation = this.hero.rotation;
         this.§_-vX§.scaleX = (this.hero.heroView.direction ? 1 : -1) * Math.abs(this.§_-vX§.scaleX);
         if(!this.§_-vX§.parentStarling && this.hero.game.map != null)
         {
            this.hero.game.map.§_-G12§.§_-83v§(this.§_-vX§.getStarlingView());
         }
         if(Boolean(this.hero) && Boolean(this.hero.heroView) && Boolean(this.hero.heroView.armature))
         {
            _loc2_ = this.hero.heroView.armature.§_-M1s§(§_-S1a§);
            if(Boolean(_loc2_) && Boolean(_loc2_.§_-81k§()))
            {
               _loc3_ = _loc2_.§_-81k§().pop();
               if(Boolean(_loc3_) && Boolean(_loc3_.childArmature) && Boolean(_loc3_.childArmature.animation))
               {
                  _loc3_.childArmature.animation.gotoAndPlay(§_-B12§,-1,-1,1,0,"dragon",§_-i2C§.§_-511§);
               }
            }
            if(this.hero.isSelf)
            {
               GameSounds.play(§_-U1O§);
            }
         }
         this.§_-vX§.gotoAndPlay(0);
         this.§_-vX§.visible = true;
      }
   }
}

